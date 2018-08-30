class MemosController < ApplicationController
	before_action :authenticate_user!
  def index
  	@days = []
  	@t = Time.now
  	@memos = current_user.memos
  	@memo = Memo.new
  end

  def new
  	@date = params[:date]
  	@memo = Memo.new
  end

  def create
	  @memo = current_user.memos.new memo_params
	  @memo.save!
	  redirect_to members_url
	end

  def edit
  	@memo = target_memo params[:id]
  end

	def update
	  @memo = target_memo params[:id]
	  @memo.update(memo_params)
	  redirect_to members_url
	end

	def destroy
	  @memo = target_memo params[:id]
	  @memo.destroy
	  redirect_to members_url
	end

private
	def target_memo memo_id
	  current_user.memos.where(id: memo_id).take
	end

	def memo_params
	  params.require(:memo).permit(:date, :content, :title, :category)
	end
end
