require 'test_helper'

class HathiRightsTest < Test::Unit::TestCase
  include FakewebHelpers
  context "Hathi Rights Instance" do    
    setup do
      fakeweb_stub_htd_get(:htd_successful)
    end
    
    should "be true" do
      @item = HathiData.find(fakeweb_stub_id(:htd_successful))
      assert @item.rights != nil
    end
  end
end