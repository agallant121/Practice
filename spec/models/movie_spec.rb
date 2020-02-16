require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :creation }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies)}
  end

  it "instance methods" do
    universal = Studio.create(name: "Universal Studios")
    movie_1 = universal.movies.create(name: "Gladiator", creation: "2000", genre: "Drama")

    brad = Actor.create(name: "Brad Pitt", age: 55)
    leo = Actor.create(name: "Leonardo Dicaprio", age: 45)
    alex = Actor.create(name: "Alex Phillips", age: 50)

    movie_1.actors << [brad, leo, alex]

    expect(movie_1.actors_by_age.first).to eq(leo)
    expect(movie_1.actors_by_age.second).to eq(alex)
    expect(movie_1.actors_by_age.last).to eq(brad)
    expect(movie_1.actors_avg_age).to eq(50)
  end
end
