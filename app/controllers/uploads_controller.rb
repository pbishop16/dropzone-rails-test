class UploadsController < ApplicationController

  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.create(upload_params)
    if @upload.save
      render json: { message: "success", fileID: @upload.id }, :status => 200
    else
      render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
    end
  end

  def download
    @upload = Upload.find(params[:id])
    send_file(@upload.image.path)
  end

  def destroy
    @upload = Upload.find(params[:id])
      respond_to do |format|
        if @upload.destroy
          format.html { redirect_to uploads_path, notice: "File Deleted from Server." }
          format.json { render json: @upload, message: "File deleted from Server." }
        else
          render json: { message: @upload.errors.full_messages.join(',') }
        end
      end
    # else
      # if @upload.destroy
      #   render json: { message: "File deleted from server." }
      # else
      #   render json: { message: @upload.errors.full_messages.join(',') }
      # end
    # end
  end

  private

  def upload_params
    params.require(:upload).permit(:image)
  end
end
