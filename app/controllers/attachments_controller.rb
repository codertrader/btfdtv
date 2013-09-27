class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  #def new
  #  @attachment = Attachment.new
  #end

  # GET /attachments/1/edit
  #def edit
  #end

  # POST /attachments
  # POST /attachments.json
  def create
    a = params[:attachment]
    @attachment = Attachment.new({:stream_id=>a[:stream_id],:name=>a[:name],:link=>a[:link],:bytes=>a[:bytes],:icon=>a[:icon],:thumbnails_64x64=>a[:thumbnails_64x64]})

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to @attachment, notice: 'Attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attachment }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
=begin
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
       require(:attachment).permit(:stream_id, :name, :link, :bytes, :icon, :thumbnails_64x64, :thumbnails_200x200, :thumbnails_640x480)
    end
end
