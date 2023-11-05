# frozen_string_literal: true

require 'cybermots/liste'
require 'cybermots/maj'
require 'cybermots/version'

module CyberMots
  BASE_MOTS = File.expand_path('../données/mots.json', __dir__)
  COULEURS = {
    anglais: '#3e8ed0',
    français: '#f14668'
  }.freeze
end
