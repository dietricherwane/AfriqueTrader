# Modèle servant à l'enregistrement des cabinets d'audit qui auditent les entreprises financières
# Un cabinet d'audit est lié à un pays et comporte plusieurs auditeurs (appelés associés)
# Un analyste peut lier un cabinet d'audit à une entreprise pour une année particulière
# Ces cabinets rédigent des rapports concernant les entreprises côtées pour une année précise

class AuditFirm < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  has_many :auditors
  belongs_to :country
  has_many :audit_reports
  has_many :companies, through: :audit_reports
  has_many :link_company_to_audit_firms
  has_many :company, through: :link_company_to_audit_firms
  belongs_to :user
  
  attr_accessible :audit_firm_id, :country_id, :name, :informations, :address, :phone_number, :fax_number, :email, :website, :user_id, :published, :verified, :verified_by, :verified_at, :verified_by_manager, :verified_by_manager_id, :verified_by_manager_at
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :audit_firm_id => "L'identifiant du cabinet d'audit",
    :country_id => "Le pays",
    :name => "Le nom du cabinet d'audit",
    :informations => "Les informations diverses",
    :address => "L'adresse",
    :phone_number => "Le numéro de téléphone",
    :fax_number => "Le numéro de fax",
    :email => "L'adresse email",
    :website => "Le site web",
    :user_id => "L'auteur"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] ||super
  end
  
  # Validations
  validates :audit_firm_id, :country_id, :name, :address, :phone_number, :fax_number, :email, :user_id, presence: true
  validates :audit_firm_id, uniqueness: {scope: :name, message: "l'identifiant du cabinet d'audit est propre à chaque cabinet"}
  validates :phone_number, :fax_number, length: {in: 6..15}
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true}
  validates :email, uniqueness: true, allow_blank: true
  validates :website, format: {with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, allow_blank: true, multiline: true}
  validates :website, uniqueness: true, allow_blank: true
  
  # Callbacks
  before_save :format_fields
  before_update :format_fields
  
  protected
  def format_fields
    self.name = StringUtils.first_letter_uppercase(self.name)
  end
end
