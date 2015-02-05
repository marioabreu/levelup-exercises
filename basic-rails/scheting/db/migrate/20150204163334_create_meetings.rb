class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.date :begins
      t.date :ends
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
