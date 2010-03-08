ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  require 'shoulda/rails'
  require 'fakeweb'
  require File.expand_path(RAILS_ROOT + '/test/support/fakeweb_helpers')
end
