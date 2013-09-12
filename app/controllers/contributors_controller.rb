class ContributorsController < ApplicationController
  before_action :set_contributor, only: [:show, :edit, :update, :destroy]

  before_action :require_login, except: [:index]
  before_action :check_admin, except: [:index]

  # GET /contributors
  # GET /contributors.json
  def index
    @contributors = Contributor.all.order(:name)
  end

  # GET /contributors/1
  # GET /contributors/1.json
  def show
  end

  # GET /contributors/new
  def new
    @contributor = Contributor.new
  end

  # GET /contributors/1/edit
  def edit
  end

  # POST /contributors
  # POST /contributors.json
  def create
    @contributor = Contributor.new(contributor_params)

    respond_to do |format|
      if @contributor.save
        format.html { redirect_to @contributor, notice: 'Contributor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contributor }
      else
        format.html { render action: 'new' }
        format.json { render json: @contributor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contributors/1
  # PATCH/PUT /contributors/1.json
  def update
    respond_to do |format|
      if @contributor.update(contributor_params)
        format.html { redirect_to @contributor, notice: 'Contributor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contributor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributors/1
  # DELETE /contributors/1.json
  def destroy
    @contributor.destroy
    respond_to do |format|
      format.html { redirect_to contributors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contributor
      @contributor = Contributor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contributor_params
      params.require(:contributor).permit(:name, :email, :twitter, :stocktwits, :facebook, :short_bio, :full_bio, :featured, :site)
    end

    def check_admin
	unless current_user.admin
	  flash[:error] = "Admin access required." 
          redirect_to contributors_path
	end
    end
end
