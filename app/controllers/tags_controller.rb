class TagsController < ApplicationController
  before_action :set_tag_memos, only: [:show]

  def index

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

  end

  private

  def set_tag_memos
    @memos = Tag.find(params[:id]).memos
  end
  def tag_params
    params.require(:tag).permit(:name).merge(user_id: current_user.id)
  end

end
