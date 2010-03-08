require 'test_helper'

class HathiDataTest < Test::Unit::TestCase
  include FakewebHelpers
  context "Hathi Data API" do    
    setup do
      fakeweb_stub_htd_get(:htd_successful)
      fakeweb_stub_htd_get(:htd_not_found)
    end
        
    should "find an existing item (HT Repository) with a HTID" do
      @item = HathiData.find(fakeweb_stub_id(:htd_successful))
      assert @item != nil
    end
 
    should "not find a non-existing item (HT Repository) with an HTID" do
      assert_raise(RecordNotFound) { HathiData.find(fakeweb_stub_id(:htd_not_found)) }
    end  
  end
end