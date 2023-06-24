require "./lib/modules/errors/error_handler.rb"
class ApplicationController < ActionController::API
  include ErrorHandler
end
