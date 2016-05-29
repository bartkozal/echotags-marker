class TriggersController < ApplicationController
  def destroy
    trigger = Trigger.find(params[:id])
    trigger.destroy
    redirect_to edit_point_path(params[:point_id])
  end
end
