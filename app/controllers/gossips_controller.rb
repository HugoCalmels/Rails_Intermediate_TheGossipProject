class GossipsController < ApplicationController
  before_action :current_gossip, only: [:show, :edit, :update, :destroy]

  def show
    @tags = []
    GossipTag.all.map do |el_gt|
      if current_gossip.id == el_gt.gossip_id
        Tag.all.map do |el_tag|
          if el_gt.tag_id == el_tag.id
            @tags << el_tag.title
          end
        end
      end
 
  

    end
    @count = 0
    @comments = []
    Comment.all.map do |el|
      if el.gossip_id == current_gossip.id
      @comments << el
      @count += 1
      end
    end
    @id = params[:id]
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

    match = ''
    Tag.all.map do |el|
      if el.title == params[:gossip][:tag]
        match = el.id
      end
    end

    gt = GossipTag.new(
      gossip_id: Gossip.last.id + 1,
      tag_id: match
    )
    if g.save && gt.save
    redirect_to root_path, success: "Gossip created Successfully!"

    else 
      redirect_to new_gossip_path, danger: g.errors.full_messages && gt.errors.full_messages
    end
  end

  def edit
  end

  def update
    if @gossip.update(gossip_params)
      redirect_to root_path, success: "Gossip successfully edited !"
    else
      redirect_to edit_gossip_path(@gossip.id), danger: @gossip.errors.full_messages
    end
  end

  def destroy
    @gossip.destroy

    redirect_to root_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def current_gossip
    @gossip = Gossip.find(params[:id])
  end
end
