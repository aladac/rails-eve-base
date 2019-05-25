class CharactersController < ApplicationController
  before_action :authenticate_user!
  layout 'rails-eve-base'
  
  def index
    @characters = current_user.characters
  end
end
