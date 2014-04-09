require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  include FakewebHelpers
  
  def setup
    fakeweb_stub_htd_get(:htd_successful)
    fakeweb_stub_bib_get(:bib_success_with_item, 'htid')
  end
  
  test "on GET to :show (w/ HTID)" do
    get :show, :id => fakeweb_stub_id(:htd_successful)
    assert_not_nil assigns(:item)
    assert_response :success
    assert_template :show
  end 

  test "on GET with undefined rights codes" do   
    get :show, :id => fakeweb_stub_id(:htd_undefined_rights)
    assert_not_nil assigns(:item)
    assert_response :success
    assert_template :show
  end
    
end
