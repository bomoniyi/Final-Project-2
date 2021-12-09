class CreateJoinedGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :joined_groups do |t|
      t.integer :user_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
