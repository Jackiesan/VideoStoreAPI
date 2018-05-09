class MoviesController < ApplicationController
  def index
    movies = Movie.all
    movies = movies.sort_by &params[:sort].to_sym if params[:sort]
    movies = movies.first(params[:n].to_i) if params[:n]
    render json: movies.as_json( only: [:id, :title, :release_date] ), status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])

    if movie != nil
      render json: movie.as_json( only: [:title, :overview, :release_date, :inventory]).merge(available_inventory: movie.available_inventory), status: :ok
    else
      render json: { errors: { title: ["Movie not found"] } }, status: :bad_request
    end
  end

  def create
    movie = Movie.create(movies_params)
    if movie.valid?
      render json: { id: movie.id }, status: :ok
    else
      render json: { errors: movie.errors }, status: :bad_request
    end
  end

  private
  def movies_params
    return params.permit(:title, :overview, :release_date, :inventory)
  end

end
