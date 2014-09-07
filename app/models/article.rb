# Modèle servant à enregistrer les articles publiés par les analystes 

class Article < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  belongs_to :article_category
  belongs_to :user
  
  attr_accessible :article_category_id, :title, :description, :user_id, :published, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :article_category_id => "La catégorie de l'article",
    :title => "Le titre de la publication",
    :description => "Le contenu de l'article",
    :user_id => "L'auteur de l'article"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :publication_category_id, :title, :description, :user_id, presence: true
  validates :title, length: {maximum: 200}
end
