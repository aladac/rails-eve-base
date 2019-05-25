# rails-eve-base

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/d7c41f3367264949827b5bd74cc12fa0)](https://app.codacy.com/app/aladac/rails-eve-base?utm_source=github.com&utm_medium=referral&utm_content=aladac/rails-eve-base&utm_campaign=Badge_Grade_Dashboard)

Since I never seem to finish bigger EVE related projects, I decided to release some of the stuff I've been using so far as a sort of a template.

If this stuff possibly helps anyone write cool stuff for EVE, big bonus.

With this gem you can generate a basic structure for a EVE Online Ruby on Rails project

## Usage

You can use this to bootstrap a EVE Online related Rails project. I probably just could have made it a template for the `rails` command but I realised that half way :D

First:

```bash
bundle add rails-eve-base # within your rails project root
```

Then:

```bash
rails generate rails_eve:install
```
And you should see:

```bash
gemfile  omniauth-crest
gemfile  devise
gemfile  mongoid
gemfile  ruby-esi
generate  mongoid:config
 create  config/mongoid.yml
 create  config/initializers/omniauth.rb
 create  app/lib/mongoid_setup.rb
 create  app/models/concerns/esi_character_api.rb
 create  app/models/character.rb
 create  app/models/alliance.rb
 create  app/models/corporation.rb
 create  config/initializers/devise.rb
 create  app/models/user.rb
 create  app/controllers/users/omniauth_callbacks_controller.rb
 insert  config/routes.rb
```


## Installation

Within your project root run:

```bash
bundle add --group development rails-eve-base
```

Or do it the longer way:

Add this line to your application's Gemfile:

```ruby
gem 'rails-eve-base'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails-eve-base
```

## Contributing
Have an idea? Forkity fork, fork and make your changes check if they work then pop a pull request

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
