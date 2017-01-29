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
    @spotlight = current_user.spotlights.build
    @resources = Resource.all
    @supportingresources = Resource.where("resource_type = 'Supporting'", params[:resource_type]).order(:title)
    @featuredresources = Resource.where("resource_type = 'Featured'", params[:resource_type]).order(:title)

  end

  # GET /spotlights/1/edit
  def edit
    @resources = Resource.all
    @supportingresources = Resource.where("resource_type = 'Supporting'", params[:resource_type]).order(:title)
    @featuredresources = Resource.where("resource_type = 'Featured'", params[:resource_type]).order(:title)
  end

  # POST /spotlights
  # POST /spotlights.json
  def create
    @spotlight = current_user.spotlights.build(spotlight_params)
    @resources = Resource.all
    @supportingresources = Resource.where("resource_type = 'Supporting'", params[:resource_type]).order(:title)
    @featuredresources = Resource.where("resource_type = 'Featured'", params[:resource_type]).order(:title)

    respond_to do |format|
      if @spotlight.save
        format.html { redirect_to @spotlight, notice: 'Spotlight was successfully created.' }
        format.json { render :show, status: :created, location: @spotlight }
      else
        format.html { render :new }
        format.json { render json: @spotlight.errors, status: :unprocessable_entity }
      end
    end
    @spotlight.attributes = {'resource_ids' => []}.merge(params[:spotlight] || {})
  end


  def update
    if @spotlight.update(spotlight_params)
      redirect_to @spotlight, notice: 'Spotlight was successfully updated.'
    else
      render :edit
    end
    @spotlight.attributes = {'resource_ids' => []}.merge(params[:spotlight] || {})
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
