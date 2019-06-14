class QuestionsController < ApplicationController
  before_action :set_question

  def show
    @score = current_group.scores.new
    @score.question_number = params[:id]
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
