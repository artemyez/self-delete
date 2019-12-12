require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
    it "create message" do
      message = Message.create(message: 'Some new message', delaydelete: true)
      message1 = Message.create(message: 'Some new message1', delaydelete: false)
      expect(message.message).to eq('Some new message')
      expect(message.delaydelete).to eq(true)
      expect(message1.message).to eq('Some new message1')
      expect(message1.delaydelete).to eq(false)
    end

    it "should return true if link is encrypted" do
      message = Message.new(message: 'Some new message', delaydelete: true)
      message.save
      expect(message_path(message.id)).not_to eq(message_path(message))
      expect(message_path(message.id).length).to be < message_path(message).length
    end

    it "shouldn't save invalid data" do
      message = Message.new(message: 'Some new message', delaydelete: nil)
      message1 = Message.new(message: '', delaydelete: true)
      expect(message.save).to eq(false)
      expect(message1.save).to eq(false)
    end

end
