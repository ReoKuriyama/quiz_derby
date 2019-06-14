class ScoresController < ApplicationController
  before_action :set_question
  before_action :answer_time_finish

  def create
    left_point = current_group.point - params[:score][:bet].to_i
    return false if left_point < 0
    score = Score.new(score_params)

    if score.save
      current_group.update(point: left_point)

      if @question.id == 5
        redirect_to root_url
      else
        redirect_to question_url(id: @question.id + 1)
      end
    else
      return false
    end
  end

  private

  def set_question
    @question = Question.find(params[:score][:question_number])
  end

  def score_params
    params.require(:score).permit(
      :bet,
      :question_number,
      :bet_team
    ).merge(group_id: current_group.id)
  end

  def answer_time_finish
    raise StandardError unless @question.available
  end
end
