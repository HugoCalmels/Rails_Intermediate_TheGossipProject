module LikesHelper

  def find_likes(thing)
    result = 0
    find_user_id = ''
    find_gossip_id = ''

    Like.all.map do |el|
      if find_user_id != el.user_id || find_gossip_id != el.gossip_id
        if el.gossip_id == thing.id  
          result += 1
          find_user_id = el.user_id
          find_gossip_id = el.gossip_id
        end
      end
    end
    return result
  end

  def is_liked?(thing)
    Like.all.map do |el|
      if el.gossip_id == thing.id
        if el.user_id == current_user.id
        return 2
        end
      end
    end
  end

  def find_like_id(thing)
    Like.all.map do |el|
      if el.gossip_id == thing.id
        if el.user_id == current_user.id
        return el.id
        end
      end
    end
  end

end
