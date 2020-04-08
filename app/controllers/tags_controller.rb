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

  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)
    redirect_to folders_path, notice: 'タグを更新しました'
  end

  def show

  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def destroy
    tag = Tag.find(params[:id])
    memos = Tag.find(tag.id).memos
    memos.each do |memo|
      memo.tag_memos.destroy
    end
    tag.destroy
    redirect_to folders_path, notice: 'タグを削除しました'
  end

  def search
    begin
      selected_tag_ids = selected_tags_params # Tag id array checked with form.
      filtered_memo_ids = Memo.filter(selected_tag_ids) # Memo id array filtered with checked tag by And condition.
      @memos = Memo.where(id: filtered_memo_ids) # Memos instance selected with filtered memo ids.
    rescue
      redirect_to root_path
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name,:folder_id).merge(user_id: current_user.id)
  end

  def set_tag_memos
    @memos = Tag.find(params[:id]).memos
  end

  def selected_tags_params
    params.require(:tag_ids)
  end
end
