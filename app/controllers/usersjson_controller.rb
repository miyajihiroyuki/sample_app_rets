class UsersjsonController < ApplicationController
protect_from_forgery :except => [:create]

#RestApi
  def index
    p "==========="

#    @users = User.where("addr1 = ?", user_params[:addr1])
    @users = Localuser.all
    ### for Json   START###
    @users = @users.map do |user| 
     {
          id: user.id,
          name: user.name,
          email: user.email,
      }
    end
    render json: @users
    ### for Json   END###
  end

  def create
 #   @user = User.new(params[:user])    # 実装は終わっていないことに注意!
      p "=====start usersjson#create======"
    
##    @user = Localuser.new({ :name => params[:name], :email =>params[:email] })    
    @user = Localuser.new(post_params)    
    if @user.save
      # 保存の成功をここで扱う。
      p "=====save success======"
    else
      p "=====save error======"
    end

#    render :action => "index"
    index
  end

  private

  def post_params
    params.require(:usersjson).permit(:name, :email)
  end

end
