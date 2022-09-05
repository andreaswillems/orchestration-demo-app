defmodule OnlineShopWeb.MovieView do
  use OnlineShopWeb, :view
  alias OnlineShopWeb.MovieView

  def render("index.json", %{movies: movies}) do
    %{data: render_many(movies, MovieView, "movie.json")}
  end

  def render("show.json", %{movie: movie}) do
    %{data: render_one(movie, MovieView, "movie.json")}
  end

  def render("movie.json", %{movie: movie}) do
    %{
      id: movie.id,
      title: movie.title,
      year: movie.year,
      genre: movie.genre
    }
  end
end
