class PodcastsController < ApplicationController
  before_action :set_podcast, only: %i[ show update destroy ]

  rescue_from ActiveRecord::RecordInvalid, with: :invalid_data_processor
  # GET /podcasts
  def index
    @podcasts = Podcast.all

    render json: @podcasts
  end

  # GET /podcasts/1
  def show
    render json: @podcast
  end

  # POST /podcasts
  def create
    podcast = Podcast.create!(podcast_params)
    render json: podcast, status: :created
    # if @podcast.save
    #   render json: @podcast, status: :created, location: @podcast
    # else
    #   render json: @podcast.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /podcasts/1
  def update
    if @podcast.update(podcast_params)
      render json: @podcast
    else
      render json: @podcast.errors, status: :unprocessable_entity
    end
  end

  # DELETE /podcasts/1
  def destroy
    @podcast.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def podcast_params
      params.require(:podcast).permit(:name, :duration)
    end

    def invalid_data_processor(data)
      render json:{
        errors: data.record.errors
      }, status: :unprocessable_entity
      
    end
end
