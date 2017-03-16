class TranslateKits < ActiveRecord::Migration
  def up
    Spree::Kit.create_translation_table!({name: :string, slug: :string }, { migrate_data: true })
  end

  def down
    Spree::Kit.drop_translation_table!

  end
end
