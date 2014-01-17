class CreateGroups < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.timestamps
    end

    create_table :user_skills do |t|
      t.integer :skill_id
      t.integer :user_id
      t.timestamps
    end
  end
end
