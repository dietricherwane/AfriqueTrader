# Modèle servant à enregistrer les auditeurs travaillant pour les cabinets d'audit

class Auditor < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  belongs_to :country
  belongs_to :audit_firm
  belongs_to :user
  
  attr_accessible :uuid, :audit_firm_id, :country_id, :position, :firstname, :lastname, :phone_number, :email, :user_id, :published, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :uuid => "Le matricule",
    :audit_firm_id => "La compagnie d'audit",
    :country_id => "Le pays",
    :position => "Le poste",
    :firstname => "Le nom",
    :lastname => "Le prénom",
    :phone_number => "Le numéro de téléphone",
    :email => "L'email",
    :user_id => "Le champ créé par"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :uuid, :audit_firm_id, :country_id, :position, :firstname, :lastname, :phone_number, :email, :user_id, presence: true
  validates :uuid, uniqueness: {scope: :audit_firm_id, message: "Les identifiants doivent être uniques pour chaque cabinet d'audit"}
  validates :phone_number, length: {in: 6..15}
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true}
  
  # Callbacks
  before_save :format_fields
  before_update :format_fields
  
  protected
  def format_fields
    self.firstname = StringUtils.every_first_letter_uppercase(self.firstname)
    self.lastname = StringUtils.every_first_letter_uppercase(self.lastname)
  end
end
