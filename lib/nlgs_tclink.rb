# Process payments with TrustCommerce

require File.join(File.dirname(__FILE__), 'nlgs_tclink', 'processor')
require File.join(File.dirname(__FILE__), 'nlgs_tclink', 'credit_card_processor')
require File.join(File.dirname(__FILE__), 'nlgs_tclink', 'echeck_processor')

module TC

  def self.version
    "0.1"
  end

end