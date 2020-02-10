class TagsController < ApplicationController
  # before_action :set_user, only: [:index, :new, :create, :show]
  # before_action :set_users_tag_list, only: [:index, :new, :create, :show]

  def index
    # binding.pry
  end

  def new
    @tag = Tag.new
  end

  def create
    # binding.pry
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to root_path, notice: 'タグを作成しました'
    else
      flash.now[:alert] = '未登録のタグ名を入力してください'
    end
  end

  def show
    @memos = Memo.find(params[:id])
  end

  private
  # def set_user
  #   @user = User.find(current_user.id)
  # end
  # def set_users_tags_list
  #   @tags = @user.tags unless @user.tags != nil 
  # end
  # def set_memos
  #   @memos = Memo.find(params[:id])
  # end
  def tag_params
    params.require(:tag).permit(:name).merge(user_id: current_user.id)
    # params.require(:tag).permit(:name, :memo_ids []).merge(user_id: current_user.id)
  end

end
