class AddColumnIv < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :encrypted_message_iv, :string
  end
end
