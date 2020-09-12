class ApplicationController < ActionController::Base

  # before_action confirm_logged_in
  # In each other controller use skip_before_action

  private
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to access_login_path
      # redirect_to prevents requested action from running
    end
  end

end
