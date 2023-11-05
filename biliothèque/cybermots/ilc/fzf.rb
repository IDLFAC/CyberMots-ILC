# frozen_string_literal: true

require 'tty/option'
require_relative 'défaut'

module CyberMots
  module ILC
    # Liste les mots d'une langue donnée ou donne la correspondance entre deux langues
    class Fzf < Défaut
      usage do
        no_command
        program 'cybermots-fzf'
        desc 'Cherche un traduction avec fzf'
      end

      argument :lang do
        permit %w[fren enfr]
        desc 'Langage à lister'
      end

      def lance
        if params[:lang] == 'fren'
          puts `cybermots cherche fren "$(cybermots liste fr | fzf)"`
        elsif params[:lang] == 'enfr'
          puts `cybermots cherche enfr "$(cybermots liste en | fzf)"`
        else
          print help(width: ILC::LARGEUR_TERM)
        end
      end
    end
  end
end
