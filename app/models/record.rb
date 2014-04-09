# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class Record
  include ActiveModel::Model
  
  attr_accessor :bib
  def self.find(id)
    Record.new(id)
  end
  
  def initialize(id)
    prefix = /(^[a-z]+)\:([0-9]+)/
    @bib = HathiBib.find(prefix.match(id)[2],prefix.match(id)[1])
  end
  
  def to_xml(params=nil)
    formatter = REXML::Formatters::Pretty.new( 5 ) # indent by 5 spaces
    output = String.new
    formatter.write(REXML::Document.new(@bib.marcxml), output)
    return output
  end
  
  def to_marcxml
    self.to_xml
  end
  
end
