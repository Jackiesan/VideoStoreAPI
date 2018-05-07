class MoviesController < ApplicationController
  def test
    render json: { ok: true }
  end

  def index
    movies = Movie.all
    render json: movies.as_json( only: [:id, :title, :release_date] ), status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie != nil
      render json: movie.as_json( only: [:title, :overview, :release_date, :inventory]), status: :ok
    else
      render json: { errors: { title: ["Movie not found"] } }, status: :bad_request
    end
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
