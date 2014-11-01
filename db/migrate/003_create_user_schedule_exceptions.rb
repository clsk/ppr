class CreateUserScheduleExceptions < ActiveRecord::Migration
  def change
    create_table :user_schedule_exceptions, :id => false do |t|
      t.references :user
      t.integer :time
      t.text :comments
    end
    add_index :user_schedule_exceptions, :user_id
  end
end
