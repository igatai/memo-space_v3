class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_user
  before_action :set_memo_list
  before_action :set_users_tag_list
  before_action :set_users_folder_list

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_user
    @user = User.find(current_user.id) if current_user != nil
  end

  def set_memo_list
    @memos = @user&.memos
  end

  def set_users_tag_list
    @user_tags = @user&.tags
  end

  def set_users_folder_list
    @user_folders = @user&.folders
  end

end
