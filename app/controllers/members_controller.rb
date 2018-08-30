class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@days = []
  	@t = Time.now
  	@memos = current_user.memos
  end

  def show
  	@memeber = target_member params[:id]
  end

  def list
  	@members = target_date params[:date]
  	@date = DateTime.parse(params[:date])
  	@member = Member.new
  end

  def month
  	@days = []
  	@t = DateTime.parse(params[:date])
  	@memos = current_user.memos
  end

  def new
  	@member = Member.new
  end

  def create
    @member = current_user.members.new member_params
    @member.save!
    redirect_to date_list_path(@member.date)
  end

  def edit
    @memeber = target_member params[:id]
  end

  def update
    @member = target_member params[:id]
    @member.update(member_params)
    redirect_to date_list_path(@member.date)
  end

  def destroy
    @member = target_member params[:id]
    @member.destroy
    redirect_to date_list_path(@member.date)
  end

  def cfg
  end

  def help
  end

  private
  def target_member member_id
    current_user.members.where(id: member_id).take
  end

  def target_date member_date
    current_user.members.where(date: member_date)
  end

  def member_params
    params.require(:member).permit(:name, :date)
 end
end
