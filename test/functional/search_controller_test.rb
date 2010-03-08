require 'test_helper'

class SearchControllerTest < ActionController::TestCase
    context "on GET to :new" do
      setup { get :new }
      should_respond_with :success
      should_render_template :search
    end   
    
    context "on GET to :run" do
      setup { get :run }
      should_respond_with 400
    end
end
