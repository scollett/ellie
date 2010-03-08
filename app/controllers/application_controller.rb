# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # Uncomment when debugging error responses
  # def local_request?
  #   false
  # end

  def rescue_action_in_public(exception)
    case exception
    when RecordNotFound
      flash.now[:error] = "No record found for #{params[:id]}"
      render :file => "#{RAILS_ROOT}/public/404_record.html", :status => 404, :layout => 'exception'
    when BibAPIDownError
      flash.now[:error] = "The HathiTrust BibAPI is down."
      render :file => "#{RAILS_ROOT}/public/503.html", :status => 503, :layout => 'exception'
    else
      super
    end
  end
  
  # custom restful helpers
  def item_path(id)
    "/items/#{id}"
  end
  # custom restful helpers
  def record_path(id)
    "/records/#{id}"
  end
  helper_method :item_path, :record_path
end

# Custom Exceptions
class BibAPIDownError < StandardError; end
class RecordNotFound < StandardError; end