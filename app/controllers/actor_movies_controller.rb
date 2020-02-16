class ActorMoviesController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.find_by(name: "Tom Hanks")
    movie.actors << actor
    redirect_to "/movies/#{movie.id}"
  end
end
