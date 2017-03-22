module Spree
  module Admin
    class KitsController < ResourceController


      respond_to :js, only: [:add_product]
      respond_to :json

      def index
        @kits = Spree::Kit.all
      end

      #retourne un js qui pop une ligne dans un tableau
      def add_product
        @product = Spree::Product.find(params[:product_id])

        puts @product.inspect
        respond_to do |format|
          format.js {}
        end


      end

      def search
         @kits = Spree::Kit.with_translations.where("name like ?", "%"+params[:q][:name_cont]+"%")

        render json: {results: @kits}
      end

      def show
        @kits = Spree::Kit.find(params[:id])
        end

      def edit
        @kits = Spree::Kit.find(params[:id])
      end

      private
      def find_resource

        Spree::Kit.friendly.find(params[:id])
      end



    end
  end
end
