class CreateManeys < ActiveRecord::Migration[5.2]
  def change
    create_table :maneys do |t|
      t.string :content
      t.string :price
      t.string :integer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
