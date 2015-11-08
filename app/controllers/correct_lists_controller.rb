class CorrectListsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @correct_data = CorrectList.new
    if @correct_data.save

    end
  end
end
