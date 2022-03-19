require 'test_helper'

class VendingMachineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vending_machine_index_url
    assert_response :success
  end

end
