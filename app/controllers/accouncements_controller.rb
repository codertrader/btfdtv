class AccouncementsController < ApplicationController
  before_action :set_accouncement, only: [:show, :edit, :update, :destroy]

  # GET /accouncements
  # GET /accouncements.json
  def index
    @accouncements = Accouncement.all
  end

  # GET /accouncements/1
  # GET /accouncements/1.json
  def show
  end

  # GET /accouncements/new
  def new
    @accouncement = Accouncement.new
  end

  # GET /accouncements/1/edit
  def edit
  end

  # POST /accouncements
  # POST /accouncements.json
  def create
    @accouncement = Accouncement.new(accouncement_params)

    respond_to do |format|
      if @accouncement.save
        format.html { redirect_to @accouncement, notice: 'Accouncement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @accouncement }
      else
        format.html { render action: 'new' }
        format.json { render json: @accouncement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accouncements/1
  # PATCH/PUT /accouncements/1.json
  def update
    respond_to do |format|
      if @accouncement.update(accouncement_params)
        format.html { redirect_to @accouncement, notice: 'Accouncement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @accouncement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accouncements/1
  # DELETE /accouncements/1.json
  def destroy
    @accouncement.destroy
    respond_to do |format|
      format.html { redirect_to accouncements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accouncement
      @accouncement = Accouncement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accouncement_params
      params.require(:accouncement).permit(:message, :starts_at, :ends_at)
    end
end
