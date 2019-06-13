class Score < ApplicationRecord
  belongs_to :group

  with_options presence: true do
    validates :question_number
    validates :bet
    validates :bet_team
  end

  validates :question_number,  uniqueness: { scope: :group_id  }

  def odd_number
    selected_group = "group#{ bet_team.to_s}"
    Odd.find(question_number).send(selected_group)
  end

  def calculate_score
    self.update(score: bet * odd_number)
  end

  def self.calculate_all_score
    not_calculated_answers = Score.where(score: nil)
    not_calculated_answers.each do |not_calculated_answer|
      not_calculated_answer.calculate_score
    end
  end
end
