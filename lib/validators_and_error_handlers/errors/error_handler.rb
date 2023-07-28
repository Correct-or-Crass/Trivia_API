require "./lib/validators_and_error_handlers/errors/error_serializer.rb"

module ValidatorsAndErrorHandlers
  module Errors
    module ErrorHandler
      def route_not_found
        detail_message = params[:action].split("_").join(" ")
        status_code = 400
        source_info = request.original_fullpath
        render json: ErrorSerializer.bad_request(detail_message, status_code, source_info), status: :bad_request
      end

      def invalid_param_value(error_message)
        detail_message = error_message
        status_code = 400
        source_info = request.original_fullpath
        ErrorSerializer.bad_request(detail_message, status_code, source_info)
      end
    end 
  end 
end