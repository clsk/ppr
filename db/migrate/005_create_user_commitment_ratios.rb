class CreateUserCommitmentRatios < ActiveRecord::Migration
  def change
    create_table :user_commitment_ratios do |t|
      t.references :user
      t.integer :ratio
      t.references :ppr_project
    end
    add_index :user_commitment_ratios, :user_id
    add_index :user_commitment_ratios, :ppr_project_id
  end
end
