# Modèle pour  l'enregistrement des utilisateurs  (entreprises financières, journalistes, analystes, vérificateurs, chefs analystes)

class User < ActiveRecord::Base
  include StringUtils  
  
  # Relationships
  belongs_to :profile
  belongs_to :social_status
  has_many :advice_categories
  has_many :advices
  has_many :audit_firms
  has_many :auditors
  has_many :audit_reports
  has_many :companies
  has_many :link_company_to_audit_firms
  has_many :sales_areas
  has_many :social_statuses
  has_many :subscriptions
  has_many :publication_categories
  has_many :publications
  has_many :company_events
  has_many :article_categories
  has_many :articles
  has_many :investment_company_categories
  has_many :investment_companies
  has_many :sgos
  has_many :sgo_managers
  
  # Scopes
  default_scope order("created_at DESC")
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
         
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :email => "L'email",
    :firstname => "Le nom",
    :lastname => "Le prénom",
    :phone_number => "Le numéro de téléphone fixe",
    :mobile_number => "Le numéro de téléphone mobile",
    :profile_id => "Le profil",
    :social_status_id => "La raison sociale",
    :trading_identifier => "Le régistre de commerce",
    :password => "Le mot de passe",
    :password_confirmation => "La confirmation de mot de passe",
    :company_name => "Le nom de l'entreprise"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
         
  attr_accessible :email, :firstname, :lastname, :phone_number, :mobile_number, :profile_id, :published, :social_status_id, :trading_identifier, :company_name, :created_by, :password, :password_confirmation, :confirmation_token
  
  # Validations
  validates :firstname, :lastname, presence: true, unless: :company?
  validates :phone_number, :profile_id, presence: true
  validates :social_status_id, :trading_identifier, :company_name, presence: true, if: :company?
  validates :company_name, length: {in: 2..50}, if: :company?
  validates :firstname, :lastname, length: {in: 2..50}, unless: :company?
  validates :phone_number, :mobile_number, length: {in: 6..15, allow_blank: true}
  
  # Utils
  def full_name
    return "<b>[#{Profile.find_by_id(profile_id).shortcut}]</b> #{lastname} #{firstname}".html_safe
  end
  
  def company_full_name
    return "<b>[#{Profile.find_by_id(profile_id).shortcut}]</b> #{company_name}".html_safe
  end
  
  def published?
    return published != false ? true : false
  end
  
  # Functions related to validations
  def company?
    Profile.find_by_name('Entreprise financière').id == profile_id.to_i rescue false
  end
  
  # Callbacks
  before_save :format_fields
  before_update :format_fields
  
  private
  def format_fields
    self.firstname = StringUtils.every_first_letter_uppercase(self.firstname)
    self.lastname = StringUtils.every_first_letter_uppercase(self.lastname)
    self.company_name = StringUtils.first_letter_uppercase(self.company_name.strip)
    self.trading_identifier = self.trading_identifier.upcase
  end
end
