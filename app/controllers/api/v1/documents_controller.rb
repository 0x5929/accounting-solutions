class Api::V1::DocumentsController < ApiController
  before_action :set_document, only: %i[show edit update destroy]
  # GET /documents or /documents.json
  def index
    @documents = Document.all
    render json: @documents
  end
  
  # GET /documents/1 or /documents/1.json
  def show
    render json: @document
  end
  
  # GET /documents/new
  def new
    @document = Document.new
  end
  
  # GET /documents/1/edit
  def edit; end
  
  # POST /documents or /documents.json
  def create
    @document = Document.new(document_params)
    
    respond_to do |format|
      if @document.save
        format.all { render json: @document, status: :created, location: "/api/v1/documents/#{@document.id}" }
      else
        format.all { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.all { render json: @document, status: :ok, location: "/api/v1/documents/#{@document.id}" }
      else
        format.all { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document.destroy

    respond_to do |format|
      format.all { head :no_content }
    end
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def document_params
    params.require(:document).permit(:user_id, :file_name, :file_location)
  end
end
  