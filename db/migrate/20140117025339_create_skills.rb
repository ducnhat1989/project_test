class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skill_details do |t|
      t.string :name
      t.integer :skill_id

      t.timestamps
    end
  end
end
