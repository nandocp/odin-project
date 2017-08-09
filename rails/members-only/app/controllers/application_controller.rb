class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper # para utilizar os métodos de login e logout no app
end
