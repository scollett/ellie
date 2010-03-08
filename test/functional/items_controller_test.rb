require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  include FakewebHelpers
  context "on GET to :show (w/ HTID)" do   
    setup do
      fakeweb_stub_htd_get(:htd_successful)
      fakeweb_stub_bib_get(:bib_success_with_item, 'htid')
      get :show, :id => fakeweb_stub_id(:htd_successful)
    end

    should_assign_to :item
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
  end 
end
