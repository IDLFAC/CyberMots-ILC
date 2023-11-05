# frozen_string_literal: true

# Dépendances natives
require 'json'

module CyberMots
  # Cherche un mot pour donner sa traduction
  class Cherche
    # Cherche un mot (insensible à la case) français pour donner sa traduction en anglais
    # @param [String] mot mot français à rechercher
    # @return [String|nil] mot traduit en anglais
    def self.fren(mot)
      cherche(:fren, mot)
    end

    # Cherche un mot (insensible à la case) anglais pour donner sa traduction en français
    # @param [String] mot mot anglais à rechercher
    # @return [String|nil] mot traduit en français
    def self.enfr(mot)
      cherche(:enfr, mot)
    end

    class << self
      private

      # Cherche un mot (insensible à la case) pour donner sa traduction
      # @param [Symbol] lang +:fren+, +:enfr+
      # @param [String] mot_cible mot à rechercher
      # @return [String|nil] mot traduit
      def cherche(lang, mot_cible)
        JSON.load_file(CyberMots::BASE_MOTS, symbolize_names: true).each do |mot|
          case lang
          when :fren
            return mot[:anglais] if mot[:français].downcase == mot_cible.downcase
          when :enfr
            return mot[:français] if mot[:anglais].downcase == mot_cible.downcase
          end
        end
        nil
      end
    end
  end
end
