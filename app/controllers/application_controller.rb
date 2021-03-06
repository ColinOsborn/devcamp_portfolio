class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  before_action :configure_permitted_parameters, if: :devise_controller?      
  before_action :set_copyright

  def set_copyright
    @copyright = OsbornViewTool::Renderer.copyright 'Colin Osborn', 'All rights reserved'
  end
end

# This section below is meant to be broken out into a specific gem
module OsbornViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
