require 'test_helper'

class InvoiceParseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invoice_parse_index_url
    assert_response :success
  end

end
