module Spree
  module Admin
    class LookbooksController < ResourceController

      before_action :load_data, except: [:index, :new]


      def index
        @lookbooks = Spree::Lookbook.all
      end

      def load_data
        if params[:id]
         @lookbook = Spree::Lookbook.friendly.find(params[:id])
        else
          @lookbook = Spree::Lookbook.new unless @lookbook
        end
      end


      def new_kit
        @kit = Kit.new
         render( template: "spree/admin/lookbooks/kits/new", locals: {resource: @kit})
      end

      def add_kit
        @kit = Spree::Kit.find(params[:kit_id])

        respond_to do |format|
          format.js {}
        end


      end



      private
      def lookbook_params
        params.require(:lookbook).permit(:name, :taxon_id)
      end

      def find_resource
        if parent_data.present?
          parent.send(controller_name).friendly.find(params[:id])
        else
          model_class.friendly.find(params[:id])
        end
      end



    end
  end
end
