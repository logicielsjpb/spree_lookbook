module Spree
  class Kit < Spree::Base
    extend FriendlyId

    has_many :spree_kits_products, -> { order(:position) }, class_name: "Spree::KitProduct"
    has_many :spree_kits_lookbooks, class_name: "Spree::KitLookbook"
    has_many :products, :through => 'spree_kits_products', class_name: "Spree::Product"
    has_many :lookbooks, :through => 'spree_kits_lookbooks', class_name: "Spree::Lookbook"

    translates :name, :slug, presence: true
    accepts_nested_attributes_for :translations, :spree_kits_products, allow_destroy: true


    has_attached_file :image,

                      styles: { mini: '32x32>', normal: '128x128>', large: '1500x760' },
                      default_style: :large
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    friendly_id :slug_candidates, use: :globalize

    def slug_candidates
      [[:name]]
    end
    def image_for product
      skp = spree_kits_products.where(product: product).first
      if skp && skp.image?
         skp.image.url(:large)
      else
        if product.images.empty?
          unless product.variants.joins(:images).any?
            return "noimage/product.png"
          end
          return product.variants.joins(:images).first.images.first.attachment.url(:large)
        else
          image = product.images.first
          image.attachment.url(:large)
        end
      end
    end

  end
end


