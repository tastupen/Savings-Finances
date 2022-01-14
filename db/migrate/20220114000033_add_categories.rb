class AddCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :maneys, :category, null: false, foreign_key: true
  end
end
