class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.integer :user_group_id
      t.integer :skill_id
      t.timestamps
    end
  end
end
