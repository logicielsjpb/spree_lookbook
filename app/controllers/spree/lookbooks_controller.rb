module Spree
  class LookbooksController < Spree::StoreController
    def show
      if params[:slug]
        @Lookbook = Spree::Lookbook.friendly.find(:slug)
      else
        @lookbook = Spree::Lookbook.joins(:kits).order(created_at: :desc).first
      end
    end
  end
end