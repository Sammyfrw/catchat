class CreateChatroom < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.belongs_to :owner, index: true, null: false
      t.string :name, null: false
      t.string :passkey, null: false
      t.timestamps null: false
    end
    add_index :chatrooms, :owner_id
  end
end
