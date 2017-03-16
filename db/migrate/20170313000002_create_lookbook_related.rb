class CreateLookbookRelated < ActiveRecord::Migration
  def change
    create_table :spree_lookbooks do |t|
      t.references :spree_taxon
      t.string :partial
      t.integer :days_between_shows
      t.datetime   :date_begin
      t.datetime   :date_end
      t.timestamps
    end

    create_table :spree_lookbook_translations do |t|
      t.references :spree_lookbook
      t.attachment :image
      t.string :name
      t.string :slug
      t.string :meta_title
      t.string :meta_description
      t.string :locale


    end

    create_table :spree_kits_lookbooks do |t|
      t.references :lookbook
      t.references :kit
      t.integer :position
    end
  end
end
