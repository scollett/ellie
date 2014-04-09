# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class Item
  attr_accessor :data, :bib
  def self.find(id)
    Item.new(id)
  end
  
  def initialize(id)
    @data = HathiData.find(id)
    @bib = HathiBib.find(id,'htid')
  end
  
  def to_xml
    @bib.marcxml
  end
end