# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class HathiBib
  attr_accessor :titles, :oclcs, :isbns, :issns, :lccns, :catalog_id, :catalog_url, :marcxml, :items, :worldcat_url
  include HTTParty
  base_uri 'catalog.hathitrust.org'
  
  def self.find(id, type)
    result = HathiBib.get("/api/volumes/full/#{type}/#{id}.json")
    if result.code == 404
      raise RecordNotFound
    elsif result.code == 200 && result['records'].empty?
      # hack until bib_data implments 404 returns
      raise RecordNotFound
    elsif result.code == 200 && !result.to_s.scan(/Fatal\serror/).empty?
      raise BibAPIDownError
    elsif result.code !=200
      raise StandardError
    end
    HathiBib.new(result)
  end
  
  def initialize(data)
    record_key = data["records"].keys.first
    @titles = data['records'][record_key]['titles']
    @oclcs = data['records'][record_key]['oclcs']
    @isbns = data['records'][record_key]['isbns']
    @issns = data['records'][record_key]['issns']
    @lccns = data['records'][record_key]['lccns']
    @catalog_id = record_key
    @catalog_url = data['records'][record_key]['recordURL']
    @marcxml = data['records'][record_key]['marc-xml']
    @items = {}
    data['items'].each do |item| 
      @items[item['htid']] = HathiItem.new(item)
    end
    @worldcat_url = "http://worldcat.org/oclc/#{data['records'][record_key]['oclcs'].first}"
  end
  
end