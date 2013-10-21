module TC

  class Processor
    begin
      require 'tclink'
    rescue LoadError
      print "Failed to load TCLink extension\n"
      exit
    end

    def send_transaction(params)
      result = TCLink.send(params)
      
      # Successful Processing
      if result["status"] == "approved"
        { status: result["status"],
          transid: result['transid'], 
          message: "Your transaction successfully processed for #{params['amount']}"
        }
      elsif result["status"] == "accepted"
        { status: result["status"],
          transid: result['transid'], 
          message: "Your transaction for #{params['amount']} has been accepted"
        }
      
      # Error Processing
      elsif result["status"] == "decline"

        decline_types = {
          decline: "of insufficient funds on the card.",
          avs: "of an invalid address.",
          cvv: "an of incorrect CVV number.",
          call: "the card must be authorized manually over the phone.",
          expiredcard: "the card has expired.",
          carderror: "the card number is invalid.",
          authexpired: "of an attempt to postauth and expired preauth.",
          fraud: "the card may be on fraud alert.",
          blacklist: "the card my be blacklisted.",
          velocity: "of too many transactions in a short time period."
        }

        #logger.info "Your transaction for #{params['amount']} has been declined because #{decline_types[ result['declinetype'].to_sym ]}"
        #logger.info decline_types[result['baddata']]
        
        { status: result["status"],
          message: "Your transaction for #{params['amount']} has been declined because #{decline_types[result['declinetype'].to_sym]} Please try again or contact your card issuer.",
          details: result
        }

      elsif result["status"] == "baddata"

        bad_data_types = {
          missingfields: "One or more fields required for this transaction type were not sent.",
          extrafields: "Fields not allowed for this transaction type were sent.",
          badformat: "A field was improperly formatted, such as non-digit characters in a number field.",
          badlength: "A field was longer or shorter than the server allows.",
          merchantcantaccept: "The merchant cannot accept data passed in this field. If the offender is \"cc\", for example, it usually means that you tried to run a card type (such as American Express or Discover) that is not supported by your account. If it was \"currency\", you tried to run a currency type not supported by your account.",
          mismatch: "Data in one of the offending fields did not crosscheck with the other offending field."
        }

        #logger.info result
        #logger.info bad_data_types[ result['baddata'].to_sym ]
        { status: result["status"],
          message: "Your transaction request containes invalid fields",
          details: result
        }
      else # result["status"] == "error" or something else unknown.
        { status: result["status"],
          message: "There was an unaticipated error processing your transaction",
          details: result
        }

      end

    end

  end

end