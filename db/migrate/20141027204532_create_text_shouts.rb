class CreateTextShouts < ActiveRecord::Migration
  def change
    create_table :text_shouts do |t|
      t.string :body, null: false
    end
  end
end
