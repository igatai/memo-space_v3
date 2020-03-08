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

  def search
    # binding.pry
    # Memo.where(tag_ids: selected_tags_params)
    selected_tag_ids = selected_tags_params
    # selected_memos_id = TagMemo.taged_memo(selected_tag_ids).pluck(:memo_id).uniq.sort

    # selected_memo_ids = TagMemo.where(tag_id: selected_tag_ids).pluck(:memo_id).uniq.sort

    # selected_memos_id = Memo
    # @memos = Tag.where(id: selected_tag_ids).includes(:memos)
    # @memos = Tag.includes(:memos).where(id: selected_tag_ids)
    # @memos = Memo.include(:tags).where(tag_id: selected_tag_ids)

    # @memos = Memo.includes(:tags).where("tags.id": selected_tag_ids).references(":tags").pluck(:id).uniq.sort

    # @memos = Memo.includes(:tags).filter(selected_tag_ids).references(":tags").pluck(:id).uniq.sort
    filtered_memo_ids = Memo.filter(selected_tag_ids)
    @memos = Memo.includes(:tags).where(id: filtered_memo_ids)
    # binding.pry
    # @memo = Memo.filter("test")
  end

  private

  def set_tag_memos
    @memos = Tag.find(params[:id]).memos
  end

  # checkbox用
  def selected_tags_params
    # binding.pry
    params.require(:tag_ids)
    # params.permit(:tag_ids)
    # params.require(:tag).permit(:name, tag_ids: [])
  end

  # def tag_params
  #   params.require(:tag).permit(:name).merge(user_id: current_user.id)
  # end


end
