class Registration < ActiveRecord::Base
  
  has_many :companies, dependent: :destroy
  accepts_nested_attributes_for :companies, allow_destroy: true

  has_many :buyers, dependent: :destroy
  #accepts_nested_attributes_for :buyers, allow_destroy: true

  has_many :vendors, dependent: :destroy
  #accepts_nested_attributes_for :vendors, allow_destroy: true

  before_create :generate_registration_id

  def company
    self.companies.first
  end

  def company_address
    "#{self.companies.first.address} #{self.companies.first.city} #{self.companies.first.state} #{self.companies.first.zip}" 
  end

  private

  def generate_registration_id
    self.registration_id = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

end