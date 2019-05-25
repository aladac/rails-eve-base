# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_user
  def esi
    if @user.persisted?
      import_character
      sign_in_and_redirect_with_flash
    else
      redirect_to new_user_registration_url
    end
  end

  protected

  def set_user
    @user = User.from_omniauth request.env['omniauth.auth']
  end

  def import_character
    @user.import_character request.env['omniauth.auth']
  end

  def sign_in_and_redirect_with_flash
    sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
    set_flash_message(:notice, :success, kind: 'EVE Online') if is_navigational_format?
  end
end
