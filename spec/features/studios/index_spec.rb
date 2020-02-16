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

    visit '/studios'
  end

  it "shows each studio and their movies on the studio index page" do

    within "#studio-#{@universal.id}" do
      expect(page).to have_content(@universal.name)
      expect(page).to have_content(@movie_1.name)
      expect(page).to have_content(@movie_2.name)
    end

    within "#studio-#{@sony.id}" do
      expect(page).to have_content(@sony.name)
      expect(page).to have_content(@movie_3.name)
      expect(page).to have_content(@movie_4.name)
    end

    within "#studio-#{@disney.id}" do
      expect(page).to have_content(@disney.name)
      expect(page).to have_content(@movie_5.name)
      expect(page).to have_content(@movie_6.name)
    end
  end
end

# Story 1
# As a user,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
