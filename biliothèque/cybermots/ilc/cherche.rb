# frozen_string_literal: true

require 'tty/option'
require_relative 'défaut'
require_relative '../cherche'

module CyberMots
  module ILC
    # Cherche un mot pour donner sa traduction
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
          # send évite un case switch pour chaque valeur et est sûr car il y a une liste blanche pour la valeur de
          # l'argument avec la commande permit
          mot = CyberMots::Cherche.send(params[:lang], params[:mot])
          puts mot.nil? ? 'Aucune traduction trouvée' : mot
        else
          print help(width: ILC::LARGEUR_TERM)
        end
      end
    end
  end
end
