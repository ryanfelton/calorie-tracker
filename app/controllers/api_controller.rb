class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :restrict_access

  private

  def restrict_access
    authenticate_or_request_with_http_token do |key, options|
      @key = key
      ApiKey.exists?(api_key: @key)
    end
  end
end
