class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.belongs_to :user, null:false
      t.string :content_type, null: false
      t.integer :content_id, null: false
      t.timestamps null: false
    end

    add_index :shouts, [:user_id]
    add_index :shouts, [:content_type, :content_id]
  end
end
