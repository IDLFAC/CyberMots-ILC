# frozen_string_literal: true

require 'tty/option'
require 'cybermots/version'

module CyberMots
  # Module utilisé pour créer l'ILC de l'exécutable
  module ILC
    # Commande par défaut pour faire hériter des propriétés
    class Défaut
      include TTY::Option

      usage do
        program 'cybermots'
      end

      flag :aide do
        short '-a'
        long '--aide'
        desc "Affiche l'aide"
      end
    end
  end
end
