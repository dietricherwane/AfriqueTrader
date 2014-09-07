# Modèle servant à l'enregistrement des entreprises côtées
# Une entreprise appartient à un pays et opère dans un secteur
# Des rapports d'audit  sont rédigés sur elle par une ou plusieurs compagnies d'audit

class Company < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  belongs_to :country
  belongs_to :sales_area
  has_many :audit_reports
  has_many :audit_firms, through: :audit_reports
  has_many :link_company_to_audit_firms
  has_many :audit_firms, through: :link_company_to_audit_firms
  belongs_to :user
  
  attr_accessible :sticker, :sales_area_id, :country_id, :name, :description, :address, :phone_number, :fax_number, :email, :website, :user_id, :published, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :sticker => "Le sticker boursier",
    :sales_area_id => "Le domaine de vente",
    :country_id => "Le nom du pays",
    :name => "Le nom de l'entreprise",
    :description => "La description de l'entreprise",
    :phone_number => "Le numéro de téléphone",
    :fax_number => "Le fax",
    :email => "L'email",
    :website => "Le nom du site web",
    :user_id => "L'auteur"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # Validations
  validates :sticker, :sales_area_id, :country_id, :name, :phone_number, :fax_number, :email, :user_id, presence: true
  validates :sticker, uniqueness: {scope: :name, message: "le sticker est propre à chaque entreprise"}
  validates :phone_number, :fax_number, length: {in: 6..15}
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true}
  validates :website, format: {with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/}
  
  # Callbacks
  before_save :format_fields
  before_update :format_fields
  
  protected
  def format_fields
    self.sticker = self.sticker.strip.upcase
    self.name = StringUtils.first_letter_uppercase(self.name)  
  end
  
end
