class Company < ActiveRecord::Base
  
  belongs_to :registration
  
  has_many :primary_contacts, dependent: :destroy
  has_many :secondary_contacts, dependent: :destroy
  accepts_nested_attributes_for :primary_contacts, allow_destroy: true
  accepts_nested_attributes_for :secondary_contacts, allow_destroy: true

  has_many :company_industries
  has_many :industries, through: :company_industries

  def update_industries(company_industries)
    self.company_industries.destroy_all # a little aggressive but easy
    company_industries.each do |industry_id| 
      self.company_industries.create({industry_id: industry_id})
    end
  end

end