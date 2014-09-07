# Modèle pour l'enregistrement des sociétés gérant les compagnies d'investissement
# Elles sont gérées par plusieurs personnes

class Sgo < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  has_many :investment_companies
  has_many :sgo_managers
  belongs_to :user
  
  attr_accessible :name, :created_date, :capital, :email, :social_status_id, :user_id, :phone_number, :fax_number, :website, :country_id, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :name => "Le nom de l'entreprise",
    :created_date => "La date de création",
    :capital => "Le capital social",
    :email => "L'email",
    :social_status_id => "La raison sociale",
    :user_id => "L'auteur",
    :phone_number => "Le numéro de téléphone",
    :fax_number => "Le numéro de fax",
    :website => "Le site web",
    :country_id => "Le pays"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] ||super
  end
  
  # Validations
  validates :name, :created_date, :social_status_id, :user_id, :country_id, presence: true
  validates :name, uniqueness: {scope: :country_id, message: "Les SGO doivent être uniques par pays"}
  validates :capital, numericality: true
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true, message: "n'est pas valide", allow_blank: true}
  validates :email, uniqueness: true, allow_blank: true
  validates :website, format: {with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, allow_blank: true}
  validates :website, uniqueness: true, allow_blank: true
  validates :phone_number, length: {minimum: 8}
end
