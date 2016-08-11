class ResourcesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :science, :finearts, :math, :ela, :socialstudies]
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
    end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = current_user.resources.build
  end

  # GET /resources/1/edit
  def edit
  end

  def finearts
    @resources = Resource.all

    @resources = Resource.subject('Fine Arts')
    if params[:elementary_finearts]
      @resources = Resource.elementary_finearts
    end

    if params[:middle_finearts]
      @resources = Resource.middle_finearts
    end

    if params[:high_finearts]
      @resources = Resource.high_finearts
    end

  end

  def science
    @resources = Resource.all

    @resources = Resource.subject('Science')
    if params[:elementary_science]
      @resources = Resource.elementary_science
    end

    if params[:middle_science]
      @resources = Resource.middle_science
    end

    if params[:high_science]
      @resources = Resource.high_science
    end

  end

  def math
    @resources = Resource.all

    @resources = Resource.subject('Math')
    if params[:elementary_math]
      @resources = Resource.elementary_math
    end

    if params[:middle_math]
      @resources = Resource.middle_math
    end

    if params[:high_math]
      @resources = Resource.high_math
    end

    end

  def ela
    @resources = Resource.all

    @resources = Resource.subject('Language Arts')
    if params[:elementary_ela]
      @resources = Resource.elementary_ela
    end

    if params[:middle_ela]
      @resources = Resource.middle_ela
    end

    if params[:high_ela]
      @resources = Resource.high_ela
    end

  end

  def socialstudies
    @resources = Resource.all

    @resources = Resource.subject('Social Studies')
    if params[:elementary_ss]
      @resources = Resource.elementary_ss
    end

    if params[:middle_ss]
      @resources = Resource.middle_ss
    end

    if params[:high_ss]
      @resources = Resource.high_ss
    end

    end

  # POST /resources
  # POST /resources.json
  def create
    @resource = current_user.resources.build(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:title, :description, :url, :lrt, :subject, :author_publisher, :grade, :standard, :readability, :keyword, language: [], role: [])
    end
end
()
