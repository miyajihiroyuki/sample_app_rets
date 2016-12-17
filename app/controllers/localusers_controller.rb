class LocalusersController < ApplicationController
#RestApi
#  def index
#    @users = User.where("addr1 = ?", user_params[:addr1])
#    @users = User.all
#    @users = @users.map do |user|
#     {
#          id: user.id,
#          name: user.name,
#          email: user.email,
#      }
#    end
#    render json: @users
#  end

  def new
    @user = Localuser.new
  end
  def create
    @user = Localuser.new(params[:user])    # 実装は終わっていないことに注意!
    if @user.save
      # 保存の成功をここで扱う。
    else
      render 'new'
    end
  end
end
