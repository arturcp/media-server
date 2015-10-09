class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy, :version]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    file = image_params[:file]

    @image = Image.new({
      custom_filename: image_params[:custom_filename],
      file: file,
      size: file.size,
      content_type: file.content_type
    })

    if @image.save
      redirect_to @image, notice: 'Transformações geradas com sucesso'
    else
      render :new
    end
  end

  def destroy
    @image.destroy
    redirect_to images_url, notice: 'Imagem removida com sucesso'
  end

  def version
    send_file("public#{@image.file.url(params[:version])}", type: @image.content_type, disposition: 'inline')
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:custom_filename, :file)
  end
end
