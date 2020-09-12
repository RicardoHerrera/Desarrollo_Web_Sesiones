class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @admins = AdminUser.sorted
  end

  def new
    @admin = AdminUser.new
  end

  def create
    @admin = AdminUser.create(admin_user_params)
    if @admin.save
      flash[:notice] = "Admin user created successfully."
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
    @admin = AdminUser.find(params[:id])
  end

  def update
    @admin = AdminUser.find(params[:id])
    if @admin.update_attributes(admin_user_params)
      flash[:notice] = "Admin user updated successfully."
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def delete
    @admin = AdminUser.find(params[:id])
  end

  def destroy
    @admin = AdminUser.find(params[:id])
    @admin.destroy
    flash[:notice] = "Admin #{@admin.username} was deleted."
    redirect_to admin_users_path
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(
      :username,
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
