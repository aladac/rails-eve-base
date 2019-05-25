# frozen_string_literal: true

Devise.setup do |config|
  config.secret_key = '5db398209eb5511b119c0973bbee2da55be0fa11d6cd27c411d79d04439b846b8747a3cffd20700fe0f1191ee54f60a1316ade15a2baf43ce471ff9c9ef702be'
  config.mailer_sender = 'evescore@evescore.online'
  require 'devise/orm/mongoid'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :esi, 'd8e64f0d0a4e4a4d867052b0c93ec01e', 'cZQvip2l9Yy7tbzmjiBCerxhsXJ3iwHHxpEy7OBW', scope: 'esi-wallet.read_character_wallet.v1'
end
