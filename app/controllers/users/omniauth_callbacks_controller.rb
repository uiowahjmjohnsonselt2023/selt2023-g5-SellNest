class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    render plain: "Callback reached"

  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end