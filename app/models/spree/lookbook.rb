module Spree
  class Lookbook < Spree::Base
    extend FriendlyId

    has_many :images


    has_many :spree_kits_lookbooks, -> { order(:position) }, class_name: "Spree::KitLookbook"

    has_many :kits, :through => 'spree_kits_lookbooks', class_name: "Spree::Kit"




    belongs_to :spree_taxon,  class_name: "Spree::Taxon"
    translates :name, :image, :slug, presence: true

    accepts_nested_attributes_for :translations, :spree_kits_lookbooks, allow_destroy: true

    friendly_id :slug_candidates, use: :globalize

    def slug_candidates
      [[:name],[:name, :id]]
    end

    class Translation
      belongs_to :spree_lookbook
      has_attached_file :image,

                        styles: { mini: '32x32>', normal: '128x128>', large: '1500x845' },
                        default_style: :large
      validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    end



  end
end


