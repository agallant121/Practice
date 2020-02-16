require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @universal = Studio.create(name: "Universal Studios")
    @sony = Studio.create(name: "Sony Pictures")
    @disney = Studio.create(name: "Disney Studios")

    @movie_1 = @universal.movies.create(name: "Gladiator", creation: "2000", genre: "Drama")
    @movie_2 = @universal.movies.create(name: "Crash", creation: "2001", genre: "Drama")

    @movie_3 = @sony.movies.create(name: "Blade Runner", creation: "2019", genre: "Sci-Fi")
    @movie_4 = @sony.movies.create(name: "The Interview", creation: "2015", genre: "Comedy")

    @movie_5 = @disney.movies.create(name: "Toy Story", creation: "1995", genre: "Family")
    @movie_6 = @disney.movies.create(name: "The Lion King", creation: "1993", genre: "Family")

    @brad = Actor.create(name: "Brad Pitt", age: 55)
    @leo = Actor.create(name: "Leonardo Dicaprio", age: 45)
    @alex = Actor.create(name: "Alex Phillips", age: 50)

    @movie_1.actors << [@brad, @leo]
    @movie_2.actors << [@brad, @alex]
    @movie_3.actors << [@brad, @leo, @alex]

    visit "/actors/#{@brad.id}"
  end

  it "shows an actor's information on thier show page" do
    expect(page).to have_content(@brad.name)
    expect(page).to have_content(@brad.age)
    expect(page).to have_content(@movie_1.name)
    expect(page).to have_content(@movie_2.name)
    expect(page).to have_content(@movie_3.name)
  end
end

# Story 2
# As a user,
# When I visit an actor's show page,
# I see their name, their age, and a list of the names of all of the movies they are in.
