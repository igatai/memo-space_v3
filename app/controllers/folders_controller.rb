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
    @folder = Folder.find(params[:id])
  end

  def destroy
    @folder = Folder.find(params[:id])
    @tags = Tag.where(folder_id: @folder.id)
    @default_folder = @user_folders.where(name: 'DefaultFolder')[0]
    @tags.each do |tag|
      tag.update_column(:folder_id, @default_folder.id)
    end
    @folder.destroy
    redirect_to folders_path, notice: 'フォルダーを削除しました'
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update(folder_params)
      redirect_to folders_path()
    else
      render :edit
    end
  end

  private
  def folder_params
    params.require(:folder).permit(:name).merge(user_id: current_user.id)
  end
end