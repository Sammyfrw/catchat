class CreateChatroomMemberships < ActiveRecord::Migration
  def change
    create_table :chatroom_memberships do |t|
      t.belongs_to :user, null: false
      t.belongs_to :chatroom, null: false

      t.timestamps null:false
    end
  end
end
