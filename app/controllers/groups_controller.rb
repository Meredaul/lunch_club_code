class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      new_balance = Balance.new
      new_balance.group = @group
      new_balance.user = current_user
      new_balance.amount = 0
      new_balance.save
      redirect_to groups_path(@group)
    else
      render :new
    end
  end

  def index
    # @groups = Group.all
  end


  private

  def group_params
    params.require(:group).permit(:title, :only_cookers)
  end
  def search_for_group
    # @group = Group.find(params[:id])
  end

  def index
    @groups = current_user.groups
  end

end
