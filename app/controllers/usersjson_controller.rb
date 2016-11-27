class UsersjsonController < ApplicationController
#RestApi
  def index
    p "==========="

#    @users = User.where("addr1 = ?", user_params[:addr1])
    @users = User.all
    ### @users = @users.map do |user|
    ###  {
    ###       id: user.id,
    ###       name: user.name,
    ###       email: user.email,
    ###   }
    ### end
    ### render json: @users
  end

  def create
 #   @user = User.new(params[:user])    # 実装は終わっていないことに注意!
    
    @user = User.new({ :name => params[:name], :email =>params[:email] })    
    if @user.save
      # 保存の成功をここで扱う。
      p "=====save success======"
    else
      p "=====save error======"
    end

#    render :action => "index"
    index

  end

end
