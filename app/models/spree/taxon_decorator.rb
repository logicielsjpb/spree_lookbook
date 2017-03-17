Spree::Taxon.class_eval do
  has_many :lookbooks,foreign_key: "spree_taxon_id"
end