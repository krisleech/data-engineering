class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :merchant_id, null: false
      t.float   :price,       null: false
      t.string  :description, null: false

      t.timestamps null: false
    end
  end
end
