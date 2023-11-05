# frozen_string_literal: true

require 'tty/option'
require_relative 'défaut'
require_relative '../liste'

module CyberMots
  module ILC
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
          # send avoid a case switch for each value and is safe because there is a whitelist for the argument with
          # permit
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
