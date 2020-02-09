class MemosController < ApplicationController
  before_action :set_user, only: [:index, :show]
  before_action :set_memo_list, only: [:index]
  before_action :set_memo_content, only: [:show,:edit]

  def index
    @memo = Memo.new
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path, notice: 'メモを作成しました'
    else
      flash.now[:alart] = 'メッセージを入力してください'
      render :index
    end
  end

  def show

  end

  def edit

  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to memo_path(memo_params)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_memo_list
    @memos = Memo.find(current_user.id)
  end

  def set_memo_content
    @memo = Memo.find(params[:id])
  end

  def memo_params
    # tag_ids: [] ... model_name + __ids + 配列表記[] -> 中間テーブルに保存
    params.require(:memo).permit(:title, :text, :image, tag_ids: []).merge(user_id: current_user.id)
  end
end
