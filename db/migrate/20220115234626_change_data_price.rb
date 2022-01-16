class ChangeDataPrice < ActiveRecord::Migration[5.2]
  def change
    change_column :maneys, :price, :integer, using: 'price::integer'
  end
end
