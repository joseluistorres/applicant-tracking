require "at/rails_router"
# Basic behavior to make a class a ViewModel that wraps ActiveRecords and helps
# with UI presentation to avoid leaking all attributes.
module BaseViewModel
  extend ActiveSupport::Concern

  class_methods do
    def wrap(objects, *args)
      Array.wrap(objects).map { |object| new(object, *args) }
    end
  end

  # @return [String] a DOM-appropriate identifier for the passed in object
  def dom_id(object, *args)
    ActionController::Base.helpers.dom_id(object, *args)
  end

  private

  # @return [AT::RailsRouter]
  def router
    @router ||= AT::RailsRouter.instance
  end
end
