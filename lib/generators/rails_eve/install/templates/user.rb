# frozen_string_literal: true

class User
  include MongoidSetup
  field :characters_count, type: Integer, default: 0
  devise :database_authenticatable, :registerable, :omniauthable,
         :rememberable, :trackable

  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at, type: Time
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable
  field :uid,                  type: Integer
  field :provider,             type: String

  has_many :characters

  def will_save_change_to_email? ;end

  def self.update_counter_caches
    all.each do |user|
      user.characters_count = user.characters.count
      user.save
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = SecureRandom.hex
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.create_from_omniauth(payload)
    u = new
    u.uid = payload.uid
    u.password = SecureRandom.hex
    u.email = 'example@example.com'
    u.save
  end

  def character_api
    ESI::CharacterApi.new
  end

  def import_character(omniauth_payload)
    character_id = omniauth_payload['extra']['raw_info']['CharacterID']
    api_character = character_api.get_characters_character_id(character_id)
    credentials = omniauth_payload['credentials']
    character = characters.where(id: character_id, name: api_character.name, corporation_id: api_character.corporation_id, alliance_id: api_character.alliance_id).first_or_create
    character.update_tokens(credentials)
  end
end
