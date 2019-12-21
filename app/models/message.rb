class Message < ApplicationRecord
  include Hashid::Rails
  validates :message, presence: true
  validates_inclusion_of :delaydelete, in: [true, false]
  #secret_key = ENV['DB_COL_ENCRYPTED_KEY']
  super_key = "12345678910111213141516171819201"#SecureRandom.hex(16)
  attr_encrypted :message, :key => super_key

end
