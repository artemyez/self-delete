class NewOne < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.boolean :delaydelete
      t.timestamps
    end
  end
end
