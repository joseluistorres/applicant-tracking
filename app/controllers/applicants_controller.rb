class ApplicantsController < ApplicationController
  def index
    @view_model = Applicants::IndexHTML.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
