class FoldersController < ApplicationController

  def index

  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
      redirect_to root_path, notice: 'フォルダーを作成しました'
    else
      flash.now[:alert] = '未登録のフォルダー名を入力してください'
    end
  end

  def edit
  end

  def destroy
    @folder = Folder.find(params[:id])
    @tags = Tag.where(folder_id: @folder.id)
    @tags.each do |tag|
      tag.update_column(:folder_id, nil)
    end
    @folder.destroy
  end

  private
  def folder_params
    params.require(:folder).permit(:name).merge(user_id: current_user.id)
  end
end