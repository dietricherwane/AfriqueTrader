# Modèle pour l'enregistrement des conseils sur les entreprises côtées par les entreprises financières
# et par les analystes. Le conseil est relatif à une entreprise précise et concerne une catégorie d'information

class Advice < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  belongs_to :company
  belongs_to :advice_category
  belongs_to :user
  
  attr_accessible :advice_category_id, :company_id, :title, :description, :user_id, :published
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :advice_category_id => "La catégorie de conseil",
    :company_id => "Le nom de l'entreprise",
    :title => "Le titre de l'article",
    :description => "Le contenu de l'article",
    :user_id => "L'auteur de l'article"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :advice_category_id, :company_id, :title, :description, :user_id, presence: true
  validates :title, length: {maximum: 200}
end
