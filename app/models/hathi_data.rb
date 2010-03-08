# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class HathiData
  attr_accessor :number_of_pages, :rights
  include HTTParty
  base_uri 'services.hathitrust.org'
  
  def self.find(handle)
    result = HathiData.get("/api/htd/meta/#{handle}")
    if result.code == 404
      raise RecordNotFound
    elsif result.code !=200
      raise StandardError
    end
    HathiData.new(result["entry"])
  end
  
  def initialize(data)
     @data = data
     @number_of_pages = @data['htd:numpages']
     @rights = HathiRights.new(@data['htd:rights'])
  end
end
