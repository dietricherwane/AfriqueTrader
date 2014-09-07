# Modèle servant à enregistrer les publications faites par les journalistes

class Publication < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  belongs_to :publication_category
  belongs_to :user
  
  attr_accessible :publication_category_id, :title, :description, :user_id, :published
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :publication_category_id => "La catégorie de conseil",
    :title => "Le titre de la publication",
    :description => "Le contenu de la publication",
    :user_id => "L'auteur de la publication"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :publication_category_id, :title, :description, :user_id, presence: true
  validates :title, length: {maximum: 200}
end
