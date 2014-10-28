class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|

      t.integer  :item_id,      null:  false
      t.integer  :purchaser_id, null:  false
      t.integer  :quantity,     null: false

      t.timestamps null: false
    end
  end
end
