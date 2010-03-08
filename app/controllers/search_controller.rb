# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class SearchController < ApplicationController  
  def new
      #render tempate
  end
  
  def run
    item = /([a-z]|[0-9])+\.([a-z]|[A-Z]|[0-9])+/
    record = /(^oclc\:)|(^lccn\:)|(^isbn\:)|(^issn\:)|(^sysid\:)/
    if(item.match(params[:id]))
      # with a item htid go direct to item page
      redirect_to item_path(params[:id])      
    elsif(record.match(params[:id]))
        redirect_to record_path(params[:id]) 
    else
      if params[:id].blank?
        flash.now[:error] = "Hmmmmmm. Please enter something for me to search on."
      else
        flash.now[:error] = "Sorry, I don't recognize that format. Use a valid htid or use a prefix (e.g. oclc, lccn, isbn, issn, sysid)"
      end
      render :action => 'new', :status => 400
    end
  end
end