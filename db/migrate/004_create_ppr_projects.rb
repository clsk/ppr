class CreatePprProjects < ActiveRecord::Migration
  def change
    create_table :ppr_projects do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.references :created_by
    end
  end
end
