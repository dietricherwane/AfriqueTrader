# Modèle servant à enregistrer les rapports d'audit produits par les compagnies d'audit pour une année précise
# Il est possible de joindre un fichier au rapport

class AuditReport < ActiveRecord::Base
  # Relationships
  belongs_to :company
  belongs_to :audit_firm
  belongs_to :user
  
  attr_accessible :company_id, :audit_firm_id, :description, :year, :user_id, :report, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :company_id => "La compagnie",
    :audit_firm_id => "Le cabinet d'audit",
    :description => "Les détails",
    :year => "L'année",
    :user_id => "Le champ créé par",
    :report => "Le fichier associé"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :company_id, :audit_firm_id, :description, :year, :user_id, :report, presence: true
  validates :year, length: {is: 4}
  validates_with AttachmentPresenceValidator, :attributes => :report
  validates_with AttachmentSizeValidator, :attributes => :report, :less_than => 9.megabytes
end
