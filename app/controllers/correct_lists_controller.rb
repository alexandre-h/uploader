class CorrectListsController < ApplicationController
  def index
    @all_correct_list = CorrectList.all
  end

  def new
  end

  def create
  end
end
