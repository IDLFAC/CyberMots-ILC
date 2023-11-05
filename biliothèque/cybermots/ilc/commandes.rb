# frozen_string_literal: true

require 'tty/option'
require_relative '../version'
require_relative 'maj'
require_relative 'liste'
require_relative 'cherche'

module CyberMots
  # Module utilisé pour créer l'ILC de l'exécutable
  module ILC
    # Commande racine, aiguille vers les autres commandes
    class Commandes
      include TTY::Option

      usage do
        no_command
        program 'cybermots'
        desc 'ILC pour CyberMots'
      end

      flag :aide do
        short '-a'
        long '--aide'
        desc "Affiche l'aide"
      end

      flag :version do
        short '-v'
        long '--version'
        desc 'Affiche la version'
      end

      def lance
        if params.errors.any?
          puts params.errors.summary
        else
          cmd, args = case ARGV[0]
                      when 'maj'
                        [Maj.new, ARGV[1..]]
                      when 'liste'
                        [Liste.new, ARGV[1..]]
                      when 'cherche'
                        [Cherche.new, ARGV[1..]]
                      end

          if cmd.nil?
            if params[:version]
              puts "CyberMots version #{CyberMots::VERSION}"
            else
              h = help(width: ILC::LARGEUR_TERM) do |sections|
                sections.add_after :description, :commandes, <<~COMMANDES.chomp

                  Commandes :
                    #{Cherche.command.first} : #{Cherche.desc.first.first}
                    #{Liste.command.first}   : #{Liste.desc.first.first}
                    #{Maj.command.first}     : #{Maj.desc.first.first}
                COMMANDES
              end
              print h
            end
          else
            cmd.parse args
            cmd.lance
          end
        end
      end
    end
  end
end
