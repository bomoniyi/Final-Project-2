class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.text :post

      t.timestamps
    end
  end
end
