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
    begin
      selected_tag_ids = selected_tags_params # Tag id array checked with form.
      filtered_memo_ids = Memo.filter(selected_tag_ids) # Memo id array filtered with checked tag by And condition.
      @memos = Memo.where(id: filtered_memo_ids) # Memos instance selected with filtered memo ids.
    rescue
      redirect_to root_path
    end
  end

  private

  def set_tag_memos
    @memos = Tag.find(params[:id]).memos
  end

  def selected_tags_params
    params.require(:tag_ids)
  end
end
