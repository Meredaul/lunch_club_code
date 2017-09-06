class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    # authorize @group
    @group.creator = current_user
      if @session.save
        new_chatroom = Chatroom.new
        new_chatroom.session = @session
        new_chatroom.save
        redirect_to chatroom_path(new_chatroom)
      else
        render :new
      end
    else
      redirect_to root_home, alert: "You can't do this!"
    end
  end

  def index
    # @groups = Group.all
  end


  private

  def search_for_group
    # @group = Group.find(params[:id])
  end

end
