class Country < ActiveRecord::Base
  include StringUtils
  
  # Relationships
  has_many :companies
  has_many :audit_firms
  has_many :auditors
  
  attr_accessible :name, :code, :published
  
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :name => "Le nom du pays",
    :code => "Le code du pays"
  }
  
  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  # validations
  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true
  validates :code, length: {is: 3}
  
  # Callbacks
  before_save :format_fields
  before_update :format_fields
  
  protected
  def format_fields
    self.name = StringUtils.first_letter_uppercase(self.name)
    self.code = self.code.strip.upcase    
  end
end
