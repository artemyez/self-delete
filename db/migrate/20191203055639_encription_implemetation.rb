class EncriptionImplemetation < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :message, :encrypted_message
  end
end
