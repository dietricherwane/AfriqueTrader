# Modèle pour l'enregistrement des catégories de compagnagnies d'investissement (FCP, SICAV)

class InvestmentCompanyCategory < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  has_many :investment_companies
  belongs_to :user
  
  attr_accessible :name, :user_id, :published
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :name => "Le nom de la catégorie",
    :user_id => "L'auteur"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :name, :user_id, presence: true
  validates :name, uniqueness: true
  
  # Callbacks
  before_save :format_fields
  before_update :format_fields
  
  protected
  def format_fields
    self.name = StringUtils.first_letter_uppercase(self.name.strip)
  end
end
