class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
