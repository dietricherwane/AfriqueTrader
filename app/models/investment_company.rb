# Modèle pour l'enregistrement des compagnies dinvestissement (FCP, SICAV), de leurs valeurs liquidatives, 
# de leur description. Elles sont gérées par des SGO

class InvestmentCompany < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  belongs_to :investment_company_category
  belongs_to :sgo
  belongs_to :user
  
  attr_accessible :investment_company_category_id, :selling_amount, :description, :user_id, :published, :social_status_id, :email, :phone_number, :fax_number, :website, :country_id, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :investment_company_category_id => "La catégorie",
    :selling_amount => "La valeur de liquidation",
    :description => "La description",
    :user_id => "L'auteur",
    :social_status => "La raison sociale",
    :email => "L'adresse email",
    :phone_number => "Le numéro de téléphone",
    :fax_number => "Le numéro de fax",
    :website =>  "Le site web",
    :country_id => "Le pays"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :investment_category_id, :description, :user_id, :social_status, :country_id, presence: true
  validates :selling_amount, numericality: true
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true, message: "n'est pas valide", allow_blank: true}
  validates :email, uniqueness: true, allow_blank: true
  validates :website, format: {with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, allow_blank: true}
  validates :website, uniqueness: true, allow_blank: true
  validates :phone_number, length: {minimum: 8}
end
