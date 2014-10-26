class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :body, null: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
