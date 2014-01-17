class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skill_details do |t|
      t.integer :user_skill_id
      t.integer :skill_detail_id
      t.integer :user_id
      t.timestamps
    end
  end
end
