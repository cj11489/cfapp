class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.interger :user_id
      t.interger :product_id
      t.float :total
    end
    add_index :orders, :user_id
    add_index :orders, :product_id
  end
end
