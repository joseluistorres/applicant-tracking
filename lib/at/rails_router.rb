require "at"

class AT::RailsRouter
  include Singleton
  include Rails.application.routes.url_helpers

  private

  def default_url_options
    Rails.application.config.action_mailer.default_url_options
  end
end
