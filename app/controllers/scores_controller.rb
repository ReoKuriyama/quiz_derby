class ScoresController < ApplicationController
  before_action :answer_time_finish

  def create
    Score.create(score_params)
    redirect_to root_url
  end

  private

  def score_params
    params.require(:score).permit(
      :bet,
      :question_number,
      :bet_team
    ).merge(group_id: current_group.id)
  end

  def answer_time_finish
    raise StandardError if Question.find(params[:score][:question_number]).finish
  end
end
