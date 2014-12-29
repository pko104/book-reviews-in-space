class CreateProfilePage < ActiveRecord::Migration
  def change
    create_table :profile_pages do |t|
      t.integer :user_id, null: false
      t.integer :candidate, null: false
    end
  end
end
