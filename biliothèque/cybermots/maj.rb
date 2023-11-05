# frozen_string_literal: true

# Dépendances natives
require 'json'
require 'tmpdir'
require 'yaml'

module CyberMots
  # Mise à jour des données
  class MiseAJour
    # URL du dépôt git de CyberMots
    CYBERMOTS_URL = 'https://github.com/IDLFAC/CyberMots.git'

    # Met à jour la base de mots
    # @param [String] base chemin vers le fichier de la base de mots
    #   (par défaut +données/mots.json+ à partir de la racine du projet)
    def self.maj(base = CyberMots::BASE_MOTS)
      rep_tmp = git_clone
      mots_données = génère_json(rep_tmp)
      File.write(base, mots_données.to_json)
    end

    class << self
      private

      # Clone le dépôt git de CyberMots contenant les données dans un répertoire temporaire
      # @return [String] chemin du répertoire temporaire
      def git_clone
        rep_tmp = Dir.mktmpdir
        `git clone --depth 1 #{CYBERMOTS_URL} #{rep_tmp}`
        rep_tmp
      end

      # Génère les méta-données des mots
      # @param [String] dossier le chemin racine où se trouve le dépôt de CyberMots
      # @return [Objet] données sous forme d'objet Ruby
      def génère_json(dossier)
        données = []

        Dir.glob("#{dossier}/mots/*.md").each do |mot|
          données << YAML.load_file(mot)
        end

        données
      end
    end
  end
end
