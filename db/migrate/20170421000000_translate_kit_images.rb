class TranslateKitImages < ActiveRecord::Migration

  def change
    add_attachment :spree_kit_translations, :image
  end

end