require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  include FakewebHelpers
  
  def setup
    fakeweb_stub_bib_get(:bib_success_with_oclc, 'oclc')
    fakeweb_stub_bib_get(:bib_failure_with_oclc, 'oclc')
  end
  
  test "SUCCESS on GET to records#show (w/ OCLC)" do
    get :show, :id => 'oclc:' + fakeweb_stub_id(:bib_success_with_oclc)
    assert_not_nil assigns(:record)
    assert_response :success
    assert_template :show
  end 
  
  test "FAILURE on GET to records#show (w/ bad OCLC)" do
    get :show, :id => 'oclc:' + fakeweb_stub_id(:bib_failure_with_oclc)
    assert_nil assigns(:record)
    assert_response 404
  end 
    
end
