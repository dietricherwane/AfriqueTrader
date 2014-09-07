# Modèle pour l'enregistrement des souscriptions des entreprises financières et des journalistes
# Le superadministrateur entre choisit l'entreprise, la période de souscription et la date d'activation
# de la souscription. Il a la possibilité de désactiver ou d'activer cette souscription alors même qu'elle
# est en cours.
# Une cron s'exécutera chaque jour pour l'envoi des mails d'alerte de fin de souscription et de désactivation
# des souscriptions expirées

class Subscription < ActiveRecord::Base
  include StringUtils
  
  # Relashionships
  belongs_to :subscription_period
  belongs_to :user
  
  attr_accessible :subscription_period_id, :user_id, :starting_at, :disabled_by, :disabled_at, :enabled, :enabled_at, :enabled_by
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :subscription_period_id => "La période de souscription",
    :user_id => "Le souscripteur",
    :starting_at => "La date de début de souscription",
    :disabled_by => "L'auteur de la désactivation",
    :disabled_at => "La date de désactivation",
    :enabled_by => "L'auteur de l'activation",
    :enabled_at => "La date d'activation"   
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :subscription_period_id, :user_id, :starting_at, :disabled_by, :disabled_at, :enabled_by, :enabled_at, presence: true
end
