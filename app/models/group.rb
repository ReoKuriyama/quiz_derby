class Group < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, authentication_keys: [:group_name]

  has_many :scores

  validates :group_name, uniqueness: true, presence: true

  def self.calculate_all_sum
    Score.calculate_all_score

    Group.all.each do |group|
      group.calculate_sum
    end
  end

  def calculate_sum
    sum = 0
    scores.each do |score|
      sum += score.score
    end

    self.update(sum: sum)
  end

  # No use email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
