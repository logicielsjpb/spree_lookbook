class RecreateSpreeKits < ActiveRecord::Migration
  def change
    create_table :spree_kits, :force => true do |t|
      t.timestamps
      t.attachment :image
    end

    create_table :spree_kits_products, :force => true do |t|
      t.references :spree_product
      t.references :kit
      t.attachment :image
      t.integer :position
    end



  end
end
