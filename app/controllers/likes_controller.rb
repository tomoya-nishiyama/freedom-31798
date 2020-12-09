class LikesController < ApplicationController

  def create
    @origin = Origin.find(params[:origin_id])
    like = current_user.likes.create(origin_id: params[:origin_id])
    
    # @likeCounts = Like.where(origin_id: params[:origin_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @origin = Origin.find(params[:origin_id])
    like = Like.find_by(origin_id: params[:origin_id], user_id: current_user.id)
    like.destroy
    # @likeCounts = Like.where(origin_id: params[:origin_id])
    # redirect_back(fallback_location: root_path)
  end

end
