require 'rails_helper'

RSpec.describe MessagesController, type: :controller do


    it "should return encrypted message" do
      message = Message.new(message: 'Some new message', delaydelete: true)
      message.save
      puts message.message
    end


end
