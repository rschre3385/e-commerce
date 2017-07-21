class LineItemController < ApplicationController
  def update
    @line_item = LineItem.find(params[:line_item_id])
    @line_item.update(quantity: params[:quantity])
    redirect_back(fallback_location: view_order_path)
  end
  
  def destroy
    # params[:line_item_id] => 3
    LineItem.find(params[:line_item_id]).destroy
    redirect_back(fallback_location: view_order_path)
  end
end
