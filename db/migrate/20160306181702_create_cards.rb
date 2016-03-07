class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :product_id
      t.string :set
      t.string :edition
      t.string :condition
      t.decimal :buy_price
      t.integer :buy_quantity
      t.integer :sell_quantity

      t.timestamps
    end
  end
end
