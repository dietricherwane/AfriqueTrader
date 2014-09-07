# Modèle pour l'enregistrement des  raisons sociales  relatives aux entreprises financières
# Qui publient des conseils sur les entreprises côtées

class SocialStatus < ActiveRecord::Base
  include StringUtils
  
  # Relashionships
  has_many :users
  belongs_to :user
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :name => "La raison sociale",
    :user_id => "Le champ créé par"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option ={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  attr_accessible :name, :user_id, :published
  
  # Validations
  validates :name, :user_id, presence: true
  validates :name, uniqueness: true
  
  # Callbacks
  before_save :class_utils
  before_update :class_utils
  
  protected
  def class_utils
    self.name = self.name.strip.upcase
  end
end
