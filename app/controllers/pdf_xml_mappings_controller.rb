class PdfXmlMappingsController < ApplicationController
  before_action :set_pdf_xml_mapping, only: [:show, :edit, :update, :destroy]

  # GET /pdf_xml_mappings
  # GET /pdf_xml_mappings.json
  def index
    @pdf_xml_mappings = PdfXmlMapping.all
  end

  # GET /pdf_xml_mappings/1
  # GET /pdf_xml_mappings/1.json
  def show
  end

  # GET /pdf_xml_mappings/new
  def new
    @pdf_xml_mapping = PdfXmlMapping.new
  end

  # GET /pdf_xml_mappings/1/edit
  def edit
  end

  # POST /pdf_xml_mappings
  # POST /pdf_xml_mappings.json
  def create
    @pdf_xml_mapping = PdfXmlMapping.new(pdf_xml_mapping_params)

    respond_to do |format|
      if @pdf_xml_mapping.save
        format.html { redirect_to @pdf_xml_mapping, notice: 'Pdf xml mapping was successfully created.' }
        format.json { render :show, status: :created, location: @pdf_xml_mapping }
      else
        format.html { render :new }
        format.json { render json: @pdf_xml_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pdf_xml_mappings/1
  # PATCH/PUT /pdf_xml_mappings/1.json
  def update
    respond_to do |format|
      if @pdf_xml_mapping.update(pdf_xml_mapping_params)
        format.html { redirect_to @pdf_xml_mapping, notice: 'Pdf xml mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @pdf_xml_mapping }
      else
        format.html { render :edit }
        format.json { render json: @pdf_xml_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_xml_mappings/1
  # DELETE /pdf_xml_mappings/1.json
  def destroy
    @pdf_xml_mapping.destroy
    respond_to do |format|
      format.html { redirect_to pdf_xml_mappings_url, notice: 'Pdf xml mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf_xml_mapping
      @pdf_xml_mapping = PdfXmlMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pdf_xml_mapping_params
      params.require(:pdf_xml_mapping).permit(:xml_node, :pdf_text, :project_id)
    end
end
