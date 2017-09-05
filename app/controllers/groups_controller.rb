class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
  end


  private

  def search_for_group
    # @group = Group.find(params[:id])
  end

end
