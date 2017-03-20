Spree::Product.class_eval do

  has_many :spree_kits_products, -> { order(:position) }, class_name: "Spree::KitProduct", foreign_key: "spree_product_id"
  has_many :kits, :through => 'spree_kits_products', class_name: "Spree::Kit"

  def with_similar_kit
    products = []
    no_kit = kits.count
    if no_kit == 0 then
      return products
    end
    rand_kit = Random.rand(no_kit)

    tids = self.taxons.where("#{Spree::Taxon.table_name}.taxonomy_id = 2").leaves.pluck(:id)

    kit_products = Spree::Product
                       .joins(:kits)
                       .where('spree_products.id != ?', self.id)
                       .where('spree_kits.id = ?', kits.offset(rand_kit).pluck(:id)[0]).uniq

    kit_products.each do |kp|
      to_add = true
      tids.each do |id|
        if kp.taxon_ids.include? id
          puts "Product #{kp.id} has taxon #{id} DO NOT ADD"
          to_add = false
        end
      end
      products << kp if to_add
    end
    return products.shuffle

  end

end