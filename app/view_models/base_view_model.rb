require "at/rails_router"

module BaseViewModel
  extend ActiveSupport::Concern

  class_methods do
    def wrap(objects, *args)
      Array.wrap(objects).map { |object| new(object, *args) }
    end
  end

  private

  # @return [AT::RailsRouter]
  def router
    @router ||= AT::RailsRouter.instance
  end
end
