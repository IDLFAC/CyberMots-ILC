# frozen_string_literal: true

require 'tty/screen'
require_relative 'commandes'
require_relative 'nom_sections'

module CyberMots
  # Module utilisé pour créer l'ILC de l'exécutable
  module ILC
    LARGEUR_TERM = TTY::Screen.width
  end
end
