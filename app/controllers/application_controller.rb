class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  private

  def authenticate
    unless auth_tokens.empty?
      authenticate_or_request_with_http_basic do |username, password|
        auth_tokens.include?(password)
      end
    end
  end

  def auth_tokens
    ENV.fetch('AUTH_TOKENS').split(',')
  end
end
