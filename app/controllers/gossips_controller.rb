class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:gossip_id])
  end

  def new
  end

  def create
    g = Gossip.new(
      title: params[:gossip][:title],
      content: params[:gossip][:content],
      user: User.first,
      like: Like.first
    )
    if g.save
    redirect_to root_path, success: "Gossip created Successfully!"

    else 
      redirect_to new_gossip_path, danger: g.errors.full_messages

    end
  end

end
