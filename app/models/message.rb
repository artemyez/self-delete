class Message < ApplicationRecord
  include Hashid::Rails
  validates :message, :delaydelete, presence: true
  #secret_key = ENV['DB_COL_ENCRYPTED_KEY']
  super_key = SecureRandom.base64(32).bytes[0..31].pack( "c" * 32 )
  attr_encrypted :message, :key => super_key

end
