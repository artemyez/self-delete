class Worker
  include Sidekiq::Worker

  def perform()
    Message.all.each do |message|
      if message.delaydelete == true && Time.now.utc >= message.created_at+300
        message.destroy
        #puts "message deleted"
      end

    end
  end
end
