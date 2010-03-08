# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class HathiItem
  attr_reader :htid, :item_url, :catalog_id, :orig, :enumcron, :rights_code, :rights_string, :last_update
  
  def initialize(data)
    @htid = data['htid']
    @item_url = data['itemURL']
    @catalog_id = data['fromRecord']
    @orig = data['orig']
    @enumcron = data['enumcron']
    @rights_code = data['rightsCode']
    @rights_string = data['usRightsString']
    @last_update = data['lastUpdate']
  end
  
end
