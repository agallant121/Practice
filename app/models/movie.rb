class Movie < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :creation
  validates_presence_of :genre

  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_by_age
    actors.order(:age)
  end

  def actors_avg_age
    actors.average(:age)
  end
end
