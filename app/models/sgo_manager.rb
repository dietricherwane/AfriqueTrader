# Modèle servant à l'enregistrement des personnes gérant les SGO

class SgoManager < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  belongs_to :sgo
  belongs_to :user
  
  attr_accessible :firstname, :lastname, :position, :phone_number, :mobile_number, :email, :published, :sgo_id, :user_id, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :firstname => "Le nom",
    :lastname => "Le prénom",
    :position => "Le poste occupé",
    :phone_number => "La ligne fixe",
    :mobile_number => "La ligne mobile",
    :email => "L'email",
    :sgo_id => "La SGO",
    :user_id => "L'auteur"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :firstname, :lastname, :position, :sgo_id, :user_id, presence: true
  validates :phone_number, :mobile_number, length: {in: 6..15, allow_blank: true}
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true, message: "n'est pas valide", allow_blank: true}
  validates :email, uniqueness: true, allow_blank: true
  
  # Callbacks
  before_save :format_fields
  before_update :format_fields
  
  protected
  def format_fields
    self.firstname = StringUtils.every_first_letter_uppercase(self.firstname)
    self.lastname = StringUtils.every_first_letter_uppercase(self.lastname)
  end
end
