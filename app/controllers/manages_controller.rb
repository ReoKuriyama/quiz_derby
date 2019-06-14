class ManagesController < ApplicationController
  before_action :filter_admin, only: %i[result calculate]

  def index
  end

  def result
    @groups = Group.where.not(id: 1).order("sum DESC")
  end

  def calculate
    Group.calculate_all_sum
    redirect_to result_manages_path
  end

  def odds
    @odds = Odd.all
  end

  private

  def filter_admin
   unless current_group.id == 1
     redirect_to root_url
   end
  end
end
