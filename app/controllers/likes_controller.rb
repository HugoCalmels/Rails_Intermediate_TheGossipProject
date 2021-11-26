class LikesController < ApplicationController

  def show
  end

  def create
    @like = Like.new(
      user: current_user, 
      gossip: Gossip.find(params[:gossip_id])
    )

    if @like.save 
      redirect_to root_path, success: "Like created Successfully!"
    else
      redirect_to new_session_path, danger: "Please login!"
    end
  end

  def destroy
    @like= Like.find(params[:id])
    @like.destroy
    
    redirect_to root_path, warning: "Like removed Successfully!"
  end

end
