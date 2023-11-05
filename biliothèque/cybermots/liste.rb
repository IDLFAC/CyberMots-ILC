# frozen_string_literal: true

# Dépendances natives
require 'json'

module CyberMots
  class Liste
    # Liste les mots français dans l'ordre alphabétique
    # @return [Array<String>] mots
    def self.fr
      liste(:fr)
    end

    # Liste les mots anglais dans l'ordre alphabétique
    # @return [Array<String>] mots
    def self.en
      liste(:en)
    end

    # Liste les correspondances français vers anglais dans l'ordre alphabétique
    # @return [Array<String>] mots et leur traduction
    def self.fren
      liste(:fren)
    end

    # Liste les correspondances anglais vers français dans l'ordre alphabétique
    # @return [Array<String>] mots et leur traduction
    def self.enfr
      liste(:enfr)
    end

    class << self
      private

      # Liste les mots dans l'ordre alphabétique (insensible à la case)
      # @param [Symbol] lang +:fr+, +:en+, +:fren+, +:enfr+
      # @return [Array<String>] mots
      def liste(lang)
        mots = []
        JSON.load_file(CyberMots::BASE_MOTS, symbolize_names: true).each do |mot|
          case lang
          when :fr
            mots << mot[:français]
          when :en
            mots << mot[:anglais]
          when :fren
            mots << "#{mot[:français]} [#{mot[:classe]}] : #{mot[:anglais]}"
          when :enfr
            mots << "#{mot[:anglais]} : #{mot[:français]} [#{mot[:classe]}]"
          end
        end
        mots.sort { |a, b| a.downcase <=> b.downcase }
      end
    end
  end
end
