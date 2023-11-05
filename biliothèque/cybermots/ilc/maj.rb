# frozen_string_literal: true

require 'tty/option'
require_relative 'défaut'
require_relative '../maj'

module CyberMots
  module ILC
    class Maj < Défaut
      usage do
        command 'maj'
        desc 'Met à jour le dictionnaire'
      end

      option :base do
        short '-b'
        long '--base chemin'
        desc 'Chemin vers la base de mots (défaut : données/mots.json à partir de la racine du projet)'
      end

      def lance
        if params[:aide]
          print help(width: ILC::LARGEUR_TERM)
        else
          params[:base] ? CyberMots::MiseAJour.maj(params[:base]) : CyberMots::MiseAJour.maj
        end
      end
    end
  end
end
