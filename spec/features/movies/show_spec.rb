require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @universal = Studio.create(name: "Universal Studios")
    @movie_1 = @universal.movies.create(name: "Gladiator", creation: "2000", genre: "Drama")

    @brad = Actor.create(name: "Brad Pitt", age: 55)
    @leo = Actor.create(name: "Leonardo Dicaprio", age: 45)
    @alex = Actor.create(name: "Alex Phillips", age: 50)
    @tom = Actor.create(name: "Tom Hanks", age: 60)


    @movie_1.actors << [@brad, @leo, @alex]

    visit "/movies/#{@movie_1.id}"
  end

  it "movie's information and its actors listed in a specific order" do
    expect(page).to have_content(@movie_1.name)
    expect(page).to have_content(@movie_1.creation)
    expect(page).to have_content(@movie_1.genre)

    expect(page).to have_content("Actors' Average Age: 50.0")
    expect(page).to have_content(@brad.name)
    expect(page).to have_content(@leo.name)
    expect(page).to have_content(@alex.name)
  end

  it "can add an actor to a movie through a form" do

    fill_in :name, with: "Tom Hanks"
    click_button "Submit"

    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content(@tom.name)
  end
end

# Story 4
# As a user,
# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)

# Story 3
# As a user,
# When I visit a movie's show page.
# I see the movie's name, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
