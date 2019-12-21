class Worker
  include Sidekiq::Worker

  def perform()
    Message.all.each do |message|
      if message.delaydelete == true && Time.now >= message.created_at+3600
        message.destroy
      end
    end
  end
end
