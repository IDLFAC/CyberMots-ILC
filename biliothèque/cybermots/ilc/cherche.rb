# frozen_string_literal: true

require 'tty/option'
require_relative 'défaut'
require_relative '../cherche'

module CyberMots
  module ILC
    class Cherche < Défaut
      usage do
        command 'cherche'
        desc 'Cherche un mot à traduire'
      end

      argument :lang do
        permit %w[fren enfr]
        desc 'Sens de la traduction'
      end

      argument :mot do
        validate '^[[[:word:]] ()-]+$'
        desc 'Mot à traduire'
      end

      def lance
        if params[:lang] && params[:mot]
          # send avoid a case switch for each value and is safe because there is a whitelist for the argument with
          # permit
          mot = CyberMots::Cherche.send(params[:lang], params[:mot])
          puts mot.nil? ? 'Aucune traduction trouvée' : mot
        else
          print help(width: ILC::LARGEUR_TERM)
        end
      end
    end
  end
end
