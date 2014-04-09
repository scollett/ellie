# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class RecordsController < ApplicationController
  respond_to :html, :xml, :marcxml
  rescue_from RecordNotFound, with: :record_not_found
  # 
  def show
    @record = Record.find(params[:id])
    raise ActionController::RoutingError.new('Not Found') if @record.nil?
    respond_with(@record) 
  end
end
