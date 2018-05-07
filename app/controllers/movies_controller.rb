class MoviesController < ApplicationController
  def test
    render json: { ok: 'success' }
  end

  def index
    movies = Movie.all
    render json: movies.as_json( only: [:id, :title, :release_date] ), status: :ok
  end

  def show
    # movie = Movie.find_by(id: params[:id])
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
