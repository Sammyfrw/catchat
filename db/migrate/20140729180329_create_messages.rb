class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :chatroom, null: false, index: true
      t.string :sender, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
