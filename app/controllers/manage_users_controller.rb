class ManageUsersController < ApplicationController
	before_action :set_user, only: %i[ show edit update destroy ]
	before_action :is_super_user?

  # GET /tags or /tags.json
  def index
		@users = User.all
  end

  # GET /tags/1 or /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @user = User.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags or /tags.json
  def create
    @user = User.new(user_params)
		@user.name = @user.name.titleize

    respond_to do |format|
      if @user.save
        format.html { redirect_to manage_user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to manage_user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to manage_users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :super_user)
    end

		def is_super_user?
			redirect_to root_path unless current_user.super_user?
		end
end
