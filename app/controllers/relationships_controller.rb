class RelationshipsController < ApplicationController
  
  def create 
    # active_relationshipsにはcurrent_user(自分のid)を、follower_idにはクリックされて保存されるuser_idを保存
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_to users_path
  end
  
  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to users_path
  end 
  
end

