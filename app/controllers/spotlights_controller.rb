class SpotlightsController < ApplicationController
  before_action :set_spotlight, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /spotlights
  # GET /spotlights.json
  def index
    @spotlights = Spotlight.all
  end


  def dashboard
    @spotlights = Spotlight.all
    @resources = Resource.all
  end

  # GET /spotlights/1
  # GET /spotlights/1.json
  def show
  end

  # GET /spotlights/new
  def new
    @spotlight = Spotlight.new
  end

  # GET /spotlights/1/edit
  def edit
  end

  # POST /spotlights
  # POST /spotlights.json
  def create
    @spotlight = Spotlight.new(spotlight_params)

    respond_to do |format|
      if @spotlight.save
        format.html { redirect_to @spotlight, notice: 'Spotlight was successfully created.' }
        format.json { render :show, status: :created, location: @spotlight }
      else
        format.html { render :new }
        format.json { render json: @spotlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spotlights/1
  # PATCH/PUT /spotlights/1.json
  def update
    respond_to do |format|
      if @spotlight.update(spotlight_params)
        format.html { redirect_to @spotlight, notice: 'Spotlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @spotlight }
      else
        format.html { render :edit }
        format.json { render json: @spotlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spotlights/1
  # DELETE /spotlights/1.json
  def destroy
    @spotlight.destroy
    respond_to do |format|
      format.html { redirect_to spotlights_url, notice: 'Spotlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spotlight
      @spotlight = Spotlight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spotlight_params
      params.require(:spotlight).permit(:description, :title, :publisher, :icon, :description_title, :image)
    end
end