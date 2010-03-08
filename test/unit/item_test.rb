require 'test_helper'

class ItemTest < Test::Unit::TestCase
  include FakewebHelpers
  context "An item instance" do
    setup do
      fakeweb_stub_htd_get(:htd_successful)
      fakeweb_stub_bib_get(:bib_success_with_item, 'htid')
    end
    
    should "exist" do
      @item = Item.find(fakeweb_stub_id(:htd_successful))
      assert @item != nil
    end    
  end
  
  context "A bad identifier for an item" do
    setup do
      fakeweb_stub_htd_get(:htd_successful)
      fakeweb_stub_bib_get(:bib_success_with_item, 'htid')
    end
    should "should result in a Record Not Found error (404)" do
      assert_raise(RecordNotFound) { Item.find(fakeweb_stub_id(:htd_not_found)) }
    end
  end
end