class ApplicationController < ActionController::API
  include ValidatorsAndErrorHandlers::Validators::ParamValidator
  include ValidatorsAndErrorHandlers::Errors::ErrorHandler
end
