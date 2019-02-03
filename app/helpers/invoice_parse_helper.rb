module InvoiceParseHelper
	def self.seven_segment_zero
		str_arr = Array[];
		str_arr.push(" _ ")
		str_arr.push("| |")
		str_arr.push("|_|")
		return str_arr;
	end

	def self.seven_segment_one
		str_arr = Array[];
		str_arr.push("   ")
		str_arr.push("  |")
		str_arr.push("  |")
		return str_arr;
	end

	def self.seven_segment_two
		str_arr = Array[];
		str_arr.push(" _ ")
		str_arr.push(" _|")
		str_arr.push("|_ ")
		return str_arr;
	end

	def self.seven_segment_three
		str_arr = Array[];
		str_arr.push(" _ ")
		str_arr.push(" _|")
		str_arr.push(" _|")
		return str_arr;
	end

	def self.seven_segment_four
		str_arr = Array[];
		str_arr.push("   ")
		str_arr.push("|_|")
		str_arr.push("  |")
		return str_arr;
	end
	def self.seven_segment_five
		str_arr = Array[];
		str_arr.push(" _ ")
		str_arr.push("|_ ")
		str_arr.push(" _|")
		return str_arr;
	end
	def self.seven_segment_six
		str_arr = Array[];
		str_arr.push(" _ ")
		str_arr.push("|_ ")
		str_arr.push("|_|")
		return str_arr;
	end
	
	def self.seven_segment_seven
		str_arr = Array[];
		str_arr.push(" _ ")
		str_arr.push("  |")
		str_arr.push("  |")
		return str_arr;
	end
	def self.seven_segment_eight
		str_arr = Array[];
		str_arr.push(" _ ")
		str_arr.push("|_|")
		str_arr.push("|_|")
		return str_arr;
	end
	def self.seven_segment_nine
		str_arr = Array[];
		str_arr.push(" _ ")
		str_arr.push("|_|")
		str_arr.push(" _|")
		return str_arr;
	end

	# method that return hash for numbers from 0 to 9
	def self.number_hash_function
		return number_hash = {
			self.seven_segment_zero => '0',
			self.seven_segment_one => '1',
			self.seven_segment_two => '2',
			self.seven_segment_three => '3',
			self.seven_segment_four => '4',
			self.seven_segment_five => '5',
			self.seven_segment_six => '6',
			self.seven_segment_seven => '7',
			self.seven_segment_eight => '8',
			self.seven_segment_nine => '9'
		}
	end
	
	# get decimal number from a seven segment array
	def self.get_invoice_number(segment_arr)
		number = number_hash_function.to_hash[segment_arr]
		unless number
			return '?'
		else
			return number
		end
	end

	# return one invoice number string
	def self.extract_invoice_number(str_arr, index)
		# output string that store one parsed invoice data
  		op_string = String.new("")
  		
  		end_index = 2+index
  		ii = 0
  		line = str_arr[0].delete!("\n")

  		while ii < line.length
  			end_index = ii + 2;
  			segment_arr = Array[]
	  		for j in 0..2
	  			segment_arr.push(str_arr[j][ii..end_index])
	  		end
	  		ii += 3
  			op_string << get_invoice_number(segment_arr)
  		end
  		if op_string.index('?')
  			 op_string << " ILLEGAL"
  		end
  		op_string
  	end

end
