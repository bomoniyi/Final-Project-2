class CreateMeetingGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :meeting_groups do |t|
      t.integer :user_id
      t.datetime :meeting_time
      t.string :title
      t.string :location

      t.timestamps
    end
  end
end
