require_relative "./error_serializer.rb"

module ErrorHandler 
  def route_not_found
    detail_message = params[:action].split("_").join(" ")
    status_code = 400
    source_info = request.original_fullpath
    render json: ErrorSerializer.bad_request(detail_message, status_code, source_info), status: :bad_request
  end
end