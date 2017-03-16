module Spree
  class KitLookbook < Spree::Base
    self.table_name = "spree_kits_lookbooks"
    acts_as_list
    belongs_to :kit, class_name: "Spree::Kit"
    belongs_to :lookbook, class_name: "Spree::Lookbook"
  end
end

