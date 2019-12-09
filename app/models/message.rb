class Message < ApplicationRecord
  include Hashid::Rails
  validates :message, presence: true
  #secret_key = ENV['DB_COL_ENCRYPTED_KEY']
  super_key = SecureRandom.hex(16)
  attr_encrypted :message, :key => super_key

end
