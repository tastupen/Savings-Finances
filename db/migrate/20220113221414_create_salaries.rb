class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.integer :annual_income
      t.integer :bonus
      t.integer :rent
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
