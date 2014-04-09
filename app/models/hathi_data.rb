# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

require 'json'
require 'oauth'
class HathiData
  attr_accessor :rights
  
  def self.find(handle)
    consumer = OAuth::Consumer.new("51031408aa", 
                                  "52e26a6b08ecf99e3930c9084756", 
                                  {:site=>"https://babel.hathitrust.org"})
    
    result = consumer.request(:get, "/cgi/htd/volume/meta/#{handle}?v=2&format=json", @token, { :scheme => :query_string })
    consumer.http.set_debug_output(STDOUT)

    if result.code == '404'
      raise RecordNotFound
    elsif result.code != '200'
      raise StandardError
    end
    response = JSON.parse(result.body)
    HathiData.new(response)
  end
  
  def initialize(data)
     @data = data
     @rights = HathiRights.new(@data['htd:rights'])
  end
end