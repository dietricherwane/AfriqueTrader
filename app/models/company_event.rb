# Modèle servant à stocker les évènements majeurs relatifs aux entreprises

class CompanyEvent < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  belongs_to :company 
  belongs_to :user
  
  attr_accessible :title, :description, :location, :starting_at, :ending_at, :latitude, :longitude, :company_id, :published, :user_id, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :title => "Le titre de l'évènement",
    :description => "Le descriptif de l'évènement",
    :location => "L'emplacement de l'évènement",
    :starting_at => "La date de début",
    :ending_at => "La date de fin",
    :latitude => "La latitude",
    :longitude => "La longitude",
    :company_id => "Le nom de l'entreprise",
    :user_id => "L'auteur"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :title, :description, :location, :starting_at, :ending_at, :company_id, :user_id, presence: true
  validates :title, length: {maximum: 200}
  validates :latitude, :longitude, numericality: true
end
