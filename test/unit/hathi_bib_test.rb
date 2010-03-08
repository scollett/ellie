require 'test_helper'

class HathiBibTest < Test::Unit::TestCase
  include FakewebHelpers
  context "Hathi Bib API" do
    setup do
      fakeweb_stub_bib_get(:bib_success_with_item, 'htid')
      fakeweb_stub_bib_get(:bib_not_found_with_item, 'htid')
    end
    
    context "Finding an item" do
      should "find an existing item (HT Repository) with an HTID" do
        @item = HathiBib.find(fakeweb_stub_id(:bib_success_with_item), 'htid')
        assert @item != nil
      end
    
      should "not find a non-existing item (HT Repository) with an HTID" do
        assert_raise(RecordNotFound) { HathiBib.find(fakeweb_stub_id(:bib_not_found_with_item), 'htid') }
      end
    end 
    
  end
end