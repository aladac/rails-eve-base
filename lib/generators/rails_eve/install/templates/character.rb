# frozen_string_literal: true

class Character
  include MongoidSetup
  include EsiCharacterApi
  field :name, type: String
  field :access_token, type: String
  field :refresh_token, type: String
  field :token_expires, type: Time
  field :display_option, type: String
  belongs_to :corporation, optional: true, counter_cache: true
  belongs_to :alliance, optional: true, counter_cache: true
  belongs_to :user, counter_cache: true

  after_save :create_corporation

  def create_corporation
    Corporation.create_from_api(corporation_id)
  end

  def wallet_journal
    wallet_api.get_characters_character_id_wallet_journal(id)
  end
end
