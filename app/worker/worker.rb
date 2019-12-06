class Worker
  include Sidekiq::Worker

  def perform()
    # if Message.where([“created_at > ? and delaydelete = ?”, Time.current + 1.hour, true])
    #    message.destroy
    #  end
    Message.all.each do |message|
      if message.delaydelete == true && Time.now >= message.created_at+300
        message.destroy
        #puts "message deleted"
      end
    end
  end
end
