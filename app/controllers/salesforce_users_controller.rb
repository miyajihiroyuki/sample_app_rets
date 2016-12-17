class SalesforceUsersController < ApplicationController
protect_from_forgery :except => [:create]

  def index
    salesforce_client
#    user_class = @client.materialize("User")
#    @sfusers = User.all
    ob_class = @client.materialize("RestTest__c")
    @sfusers = ob_class.all
  end

  def show
    salesforce_client
#    user_class = @client.materialize("User")
#    @sfuser = User.find_by_Id(params[:id])
    ob_class = @client.materialize("RestTest__c")
    @sfuser = ob_class.find_by_Id(params[:id])
  end

  def new
    salesforce_client
    ob_class = @client.materialize("RestTest__c")
  #  @sfuser = ob_class.new
  end

  def edit
    salesforce_client
    ob_class = @client.materialize("RestTest__c")
  end

  def create
    salesforce_client
#    @user = Localuser.new({ :name => params[:name], :email =>params[:email] })    
    ob_class = @client.materialize("RestTest__c")
      p "=====Salesforce save before======params::"+params[:salesforce_user].to_s+"  CPU__c::"+params[:salesforce_user][:CPU__c].to_s
#    @client.create("RestTest__c", {"CPU__c" => params[:CPU__c], "temperature__c" => params[:temperature__c]})
    @sfuser = @client.create("RestTest__c", post_params)
      p "=====Salesforce save after======post_params::"+post_params.to_s

#    index
#    render json: ob_class.all
##    redirect_to salesforce_users_path
    redirect_to "/salesforce_users/"+@sfuser.Id
  end

  def update
##    salesforce_client
##    ob_class = @client.materialize("RestTest__c")
  end

  def delete
##    salesforce_client
##    ob_class = @client.materialize("RestTest__c")
  end

  private

  def salesforce_client
    @client = Databasedotcom::Client.new client_id: ENV['DATABASEDOTCOM_CLIENT_ID'], client_secret: ENV['DATABASEDOTCOM_CLIENT_SECRET']
    @client.authenticate :username => ENV['DATABASEDOTCOM_CLIENT_USERNAME'], :password => ENV['DATABASEDOTCOM_CLIENT_AUTHENTICATE_PASSWORD']
  end
  def post_params
    params.require(:salesforce_user).permit(:CPU__c, :temperature__c)
  end
end
