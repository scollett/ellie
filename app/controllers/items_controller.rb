# Copyright (c) 2010 The Regents of the University of California
# Released under New BSD License linked at http://www.opensource.org/licenses/bsd-license.php
# Author: SLC, Date: 2010/03/05

class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end
end
