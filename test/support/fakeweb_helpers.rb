require 'yaml'

# Code modified from http://bkocik.net/2009/05/07/testing-twitter-oauth-with-cucumber-webrat-and-fakeweb/
module FakewebHelpers  
  # Make sure nothing gets out (IMPORTANT)  
  FakeWeb.allow_net_connect = false  
  
  # Load stub data and convert string to symbols for easy test referencing
  STUBS = YAML.load_file("#{RAILS_ROOT}/test/support/fakeweb_stubs.yml").inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo} 

  def fakeweb_stub_htd_get(name)
    fakeweb_stub_get('http://services.hathitrust.org:80/api/htd/meta/' + STUBS[name]['id'], STUBS[name]['response'])
  end
  
  def fakeweb_stub_bib_get(name, key)
    fakeweb_stub_get("http://catalog.hathitrust.org/api/volumes/full/#{key}/#{STUBS[name]['id']}.json", STUBS[name]['response'])
  end
  
  def fakeweb_stub_id(name)
    STUBS[name]['id']
  end
  
  # Turns a fixture file name into a full path  
  def response_file(filename)  
    return '' if filename == ''  
    File.expand_path(RAILS_ROOT + '/test/responses/' + filename)  
  end  
  
  # Convenience methods for stubbing URLs to fixtures  
  def fakeweb_stub_get(url, filename) 
    FakeWeb.register_uri(:get, url, :response => response_file(filename))  
  end  
  
  def fakeweb_stub_post(url, filename)  
    FakeWeb.register_uri(:post, url, :response => response_file(filename))  
  end  
  
  def fakeweb_stub_any(url, filename)  
    FakeWeb.register_uri(:any, url, :response => response_file(filename))  
  end  
end

