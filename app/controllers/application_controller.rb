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
    @user = User.find(current_user&.id) if current_user != nil
    cookies[:user_id] = current_user&.id if current_user != nil
  end

  def set_memo_list
    # @memos = @user&.memos
    # @memos = @user&.memos.page(params[:page]).per(10)
    @memos = Memo.includes(:user).where(user_id: current_user.id).page(params[:page]).per(10) if current_user != nil
  end

  def set_event_list
    @events = @user&.events
  end

  def set_wrapper_list
    @wrapper = Array.new
    @wrapper = (@memos + @events).sort! { |obj| obj.updated_at }.reverse
  end

  def set_users_tag_list
    @user_tags = @user&.tags
    # @tags_nofolder = @user_tags&.where(folder_id: nil)
  end

  def set_users_folder_list
    @user_folders = @user&.folders
  end
end
