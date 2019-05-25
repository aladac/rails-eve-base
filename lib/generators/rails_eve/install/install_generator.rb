module RailsEve
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def install
      gem 'omniauth-crest'
      gem 'devise'
      gem 'mongoid'
      gem 'ruby-esi'

      generate 'mongoid:config'
  
      copy_file 'omniauth.rb', './config/initializers/omniauth.rb'
      copy_file 'mongoid_setup.rb', './app/lib/mongoid_setup.rb'
      copy_file 'esi_character_api.rb', './app/models/concerns/esi_character_api.rb'
      copy_file 'character.rb', './app/models/character.rb'
      copy_file 'alliance.rb', './app/models/alliance.rb'
      copy_file 'corporation.rb', './app/models/corporation.rb'
      copy_file 'devise.rb', './config/initializers/devise.rb', force: true
      copy_file 'user.rb', './app/models/user.rb', force: true
      copy_file 'omniauth_callbacks_controller.rb', './app/controllers/users/omniauth_callbacks_controller.rb'
      inject_into_file './config/routes.rb', after: "Rails.application.routes.draw do\n" do <<-'RUBY'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
        RUBY
      end
    end
  end
end
