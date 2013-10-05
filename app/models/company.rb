class Company < ActiveRecord::Base
  
  belongs_to :registration
  
  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true
  
  has_many :company_industries
  has_many :industries, through: :company_industries

  def update_industries(company_industries)
    self.company_industries.destroy_all # a little aggressive but easy
    company_industries.each do |industry_id| 
      self.company_industries.create({industry_id: industry_id})
    end
  end

end