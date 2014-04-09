class ApplicationController < ActionController::Base
  #rescue_from RecordNotFound, with: :record_not_found


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :item_path, :record_path
  
  
  # custom restful helpers
  def item_path(id)
    "/items/#{id}"
  end
  # custom restful helpers
  def record_path(id)
    "/records/#{id}"
  end
  

  
  private
  def record_not_found
    render text: "404 Not Found", status: 404
  end
 
end

# Custom Exceptions
class BibAPIDownError < StandardError; end
class RecordNotFound < StandardError; end