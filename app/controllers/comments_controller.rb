class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create

  @gossip = Gossip.find(params[:gossip_id])

  @comment = Comment.new(
    content: params[:content],
    gossip: @gossip,
    user: User.all.sample,
    like: Like.all.sample
  ) 

    if @comment.save
      redirect_to gossip_path(@gossip.id, @comment.id), success: "Comment created Successfully!"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])

    if @comment.update(content: params[:content])
      redirect_to gossip_path(@gossip.id, @comment.id), success: "Comment edited Successfully!"
    else 
    end


  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to gossip_path(@gossip.id, @comment.id), warning: "Comment destroyed Successfully!"
  end

end
