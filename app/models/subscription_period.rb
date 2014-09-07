# Modèle servant à enregistrer les périodes de souscription des journalistes et entreprises financières

class SubscriptionPeriod < ActiveRecord::Base
  include StringUtils
  
  # Relashionships
  has_many :subscriptions
  
  attr_accessible :amount, :published
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :amount => "La période de souscription"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :amount, numericality: {only_interger: true, greater_than: 0}
end
