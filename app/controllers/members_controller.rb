class MembersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@members = current_user.members
  end

  def show
  	@member = target_member params[:id]
  end

  def new
  	@member = Member.new
  end

  def create
    @member = current_user.members.new member_params
    @member.save!
    redirect_to members_url
  end

  def edit
    @memeber = target_member params[:id]
  end

  def update
    @member = target_member params[:id]
    @member.update(member_params)
    redirect_to @member
  end

  def destroy
    @member = target_member params[:id]
    @member.destroy
    redirect_to members_url
  end

  def cfg
  end

  private
  def target_member member_id
    current_user.members.where(id: member_id).take
  end

  def member_params
    params.require(:member).permit(:name, :date)
 end
end
