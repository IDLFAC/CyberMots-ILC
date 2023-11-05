# frozen_string_literal: true

require 'tty/option'
require_relative 'défaut'
require_relative '../liste'

module CyberMots
  module ILC
    # Liste les mots d'une langue donnée ou donne la correspondance entre deux langues
    class Liste < Défaut
      usage do
        command 'liste'
        desc 'Liste tous les mots'
      end

      argument :lang do
        permit %w[fr en fren enfr]
        desc 'Langage à lister'
      end

      def lance
        if params[:lang]
          # send évite un case switch pour chaque valeur et est sûr car il y a une liste blanche pour la valeur de
          # l'argument avec la commande permit
          CyberMots::Liste.send(params[:lang]).each do |mot|
            puts mot
          end
        else
          print help(width: ILC::LARGEUR_TERM)
        end
      end
    end
  end
end
