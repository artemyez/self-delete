class Message < ApplicationRecord
  include Hashid::Rails
  validates :message, presence: true
  validates_inclusion_of :delaydelete, in: [true, false]
  super_key = SecureRandom.hex(16)
  attr_encrypted :message, :key => super_key

end
