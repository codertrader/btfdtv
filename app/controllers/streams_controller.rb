class StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :edit, :update, :destroy, :attachments, :create_video_tag, :list_video_tags, :delete_video_tags]

  before_action :require_login, except: [:index,:show,:attachments, :list_video_tags]
  before_action :check_admin, except: [:index,:show,:attachments, :list_video_tags, :create_video_tag, :delete_video_tag]

  def attachments
    respond_to do |format|
      format.js
    end
  end

  def list_video_tags
    @video = Video.find_or_create_by(slug: params[:slug])

    respond_to do |format|
      format.js { render action: 'create_video_tag' }
    end
  end

  def delete_video_tag
    @video = Video.find_or_create_by(slug: params[:slug])
    @video.taggings.each do |tagging|
      if tagging.tag.name===(params[:tag])
        if(current_user.admin || tagging.tagger_id === current_user.id) 
          tagging.destroy
        else
          @delete_video_tag_error = 'Only an admin or the creator of the tag may delete a tag.'
        end
      end
    end
    @video.save

    respond_to do |format|
      format.js
    end
  end

  def create_video_tag
    @video = Video.find_or_create_by(slug: params[:slug])
    @video.stream = @stream
    @video.save
 
    @user = User.find(params[:userId])
    taggings = @video.tags_from(@user)
    
    params[:tag].split(/[ ,]/).each do |tag|
      #@video.tag_list << tag unless ( @video.tag_list.map(&:to_s).include?(tag) or Obscenity.profane?(tag) )
      taggings << tag unless ( taggings.map(&:to_s).include?(tag) or Obscenity.profane?(tag) or @video.taggings.map(&:tag).map(&:name).include?(tag) )
    end

    @user.tag(@video, :with => taggings, :on => :tags) 

    respond_to do |format|
      format.js
    end
  end

  # GET /streams
  # GET /streams.json
  def index
    @streams = Stream.all
    @stream = Stream.first
  end

  # GET /streams/1
  # GET /streams/1.json
  def show
  end

  # GET /streams/new
  def new
    @stream = Stream.new
  end

  # GET /streams/1/edit
  def edit
  end

  # POST /streams
  # POST /streams.json
  def create
    @stream = Stream.new(stream_params)

    respond_to do |format|
      if @stream.save
        format.html { redirect_to @stream, notice: 'Stream was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stream }
      else
        format.html { render action: 'new' }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streams/1
  # PATCH/PUT /streams/1.json
  def update
    respond_to do |format|
      if @stream.update(stream_params)
        format.html { redirect_to @stream, notice: 'Stream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streams/1
  # DELETE /streams/1.json
  def destroy
    @stream.destroy
    respond_to do |format|
      format.html { redirect_to streams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stream
      @stream = Stream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stream_params
      params.require(:stream).permit(:name)
    end
end
