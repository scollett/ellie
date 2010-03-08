# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_elephant_session',
  :secret      => '66bba2fe970b51ae2dd7af74c3ef45915c48ca596cc19ab5faedfb2b98dac638839fe60063b8636c2518600f7177ac985244c64e3740f9ae28bc7b7db6b866bf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
