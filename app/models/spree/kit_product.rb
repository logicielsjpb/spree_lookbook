module Spree
  class KitProduct < Spree::Base
    self.table_name = "spree_kits_products"

    acts_as_list
    belongs_to :kit, class_name: "Spree::Kit"
    belongs_to :product, class_name: "Spree::Product", foreign_key: "spree_product_id"

    has_attached_file :image,

                      styles: { mini: '32x32>', normal: '128x128>', product: '240x240>', large: '600x600>' },
                      default_style: :large
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  end
end

