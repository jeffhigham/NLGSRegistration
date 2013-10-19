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
      if result["status"] == "approved"
        { status: "approved",
          transid: result['transid'], 
          message: "Your transaction successfully processed $#{params['amount']}"
        }
      else
        { status: "failed",
          message: "Your transaction failed",
          details: result
        }
      end
    end

  end

end