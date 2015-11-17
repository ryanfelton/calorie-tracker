class Api::ApiKeysController < ApiController
  respond_to :json
  skip_before_filter :restrict_access, :only => [:create]

  def create
    authenticated_user = User.find_by_email(login_params[:email]).authenticate(login_params[:password])
    respond_to do |format|
      format.json {
        if authenticated_user
          @api_key = ApiKey.create(user: authenticated_user)
          render :json => {
            :user_id => authenticated_user.id, :email => authenticated_user.email, :api_key => @api_key.api_key
          }
        else
          head :unauthorized
        end
      }
    end
  end

  def destroy
    authenticated_user = ApiKey.where(:api_key => @api_key).first.try(:user)
    if (authenticated_user)
      authenticated_user.api_keys.destroy_all
    end
    render :json => {:success => true}
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
