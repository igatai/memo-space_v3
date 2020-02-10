class TagsController < ApplicationController
  before_action :set_user, only: [:index, :new]
  before_action :set_tags, only: [:index, :new, :show]

  def index
    # binding.pry
  end

  def new
    @tag = Tag.new
  end

  def create
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
  def set_user
    @user = User.find(current_user.id)
  end
  def set_tags
    @tags = @user.tags
  end
  def set_memos
    @memos = Memo.find(params[:id])
  end
  def tag_params
    params.require(:tag).permit(:name).merge(user_id: current_user.id)
    # params.require(:tag).permit(:name, :memo_ids []).merge(user_id: current_user.id)
  end

end
