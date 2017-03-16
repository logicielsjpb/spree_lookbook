module Spree
  class Kit < Spree::Base
    has_many :spree_kit_product
    has_many :spree_kit_lookbook
    has_many :spree_products, :through => 'spree_kit_product'
    has_many :spree_lookbooks, :through => 'spree_kit_lookbook'

    translates :name, presence: true


    has_attached_file :image,

                      styles: { mini: '32x32>', normal: '128x128>', large: '1100x467>' },
                      default_style: :large,
                      path: '/:class/:id/:style/:basename.:extension',
                      default_url: '/assets/bebefille.jpg'


  end
end


