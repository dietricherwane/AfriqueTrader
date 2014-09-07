# Modèle de jointure pour la mise en lien des entreprises côtées et  des compagnies d'audit pour une année particulière

class LinkCompanyToAuditFirm < ActiveRecord::Base
  # Relationships
  belongs_to :company
  belongs_to :audit_firm
  belongs_to :user
  
  attr_accessible :company_id, :audit_firm_id, :year, :user_id, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :company_id => "La compagnie",
    :audit_firm_id => "Le cabinet d'audit",
    :year => "L'année",
    :user_id => "L'auteur"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :company_id, :audit_firm_id, :year, :user_id
  validates :year, length: {is: 4}
end
