class AddSpamToShouts < ActiveRecord::Migration
  def change
    add_column :shouts, :spam, :boolean
    change_column_null :shouts, :spam, false
    change_column_default :shouts, :spam, false
  end
end
