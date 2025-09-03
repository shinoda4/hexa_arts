class HomesController < ApplicationController
  def index
    @majors = Major.all
  end
end
