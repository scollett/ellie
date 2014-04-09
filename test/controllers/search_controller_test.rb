require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  
    test "on GET to :new" do
      get :new
      assert_response  :success
      assert_template :search
    end   
    
    test "on GET to :run" do
      get :run 
      assert_response  400
    end
    
end
