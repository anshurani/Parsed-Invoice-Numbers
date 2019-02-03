class InvoiceParseController < ApplicationController
	include InvoiceParseHelper

  def index
  end

  def create
  	temp_file = params[:file].tempfile
  	file = File.open(temp_file, "r")
    # method to read file data and convert to numbers
    invoice_data = extract_data_from_uploaded_file(file)
    # after successfully converting data in numbers, it is method to download file 
	  download_file(invoice_data)
	
  end

  def show
  end
  
  private

  def extract_data_from_uploaded_file(file)
    # array to store 3 line data at a time 
    str_arr = Array[]
    # array that stores all parsed invoice data
    invoice_data = Array[]
    
    File.readlines(file).each_with_index do |line, index|
      # send data into group of 3 lines
      if (index+1) % 4 == 0 && index != 0
        invoice_number = InvoiceParseHelper.extract_invoice_number(str_arr, index)
        invoice_data.push(invoice_number)
        str_arr = Array[]
      else
        str_arr.push(line)
      end
    end
    invoice_data
  end

  def download_file(invoice_numbers)
    File.open("/tmp/output-#{Time.now}.txt", 'w') do |f2|  
        f2.puts invoice_numbers
      end

    send_file "/tmp/output-#{Time.now}.txt"
  end

end
