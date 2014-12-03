class CreatePprTasks < ActiveRecord::Migration
  def change
    create_table :ppr_tasks do |t|
      t.string :subject
      t.text :description
      t.date :due_date
      t.references :user
      t.integer :priority
      t.date :start_date
      t.float :estimated_hours
      t.references :parent_id
      t.references :ppr_project
    end
    add_index :ppr_tasks, :user_id
    add_index :ppr_tasks, :parent_id_id
    add_index :ppr_tasks, :ppr_project_id
  end
end
