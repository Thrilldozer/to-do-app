class ItemsController < ApplicationController
  before_action :set_user


  def create
    @item = @user.items.new(item_params)

    if @item.save
      flash[:notice] = "Item was successfully created."
    else
      flash[:notice] = "item was not saved, please make to do item over 8 characters and under 101  "
    end
    redirect_back fallback_location: root_path
  end

  def destroy

    @item = Item.find(params[:id])

      if @item.destroy

        respond_to do |format|
          format.js {  flash.now[:notice] = "Item Deleted" }
      end
      else
        flash[:alert] = "failed"
      end

  end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def item_params
        params.require(:item).permit(:name)
      end

end
