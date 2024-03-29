module ValidatorsAndErrorHandlers
  module Errors
    class ErrorSerializer
      def self.bad_request(detail_message, status_code, source_info)
        {
          errors:
          [ 
            {
            title: "Bad Request",
            detail: detail_message,
            status: status_code.to_s, 
            source: {
                    pointer: source_info,
                    }
            } 
          ]
        }
      end
    end
  end
end