class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  validates :start_date, presence: true, on: :create
  validates :title, presence: true, length: {minimum: 5 ,maximum: 140}
  validates :description, presence: true, length: {minimum: 20 ,maximum: 2000}
  validates :location, presence: true
  validate :duration_multiple_of_five

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  # Validation pour vérifier que start_date n'est pas dans le passé
  validate :start_date_is_in_the_future

  private

  def duration_multiple_of_five
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "must be a multiple of 5")
    end
  end
  # Méthode personnalisée pour vérifier que start_date est dans le futur
  def start_date_is_in_the_future
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end
end
