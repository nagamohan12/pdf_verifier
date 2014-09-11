class PdfXmlMappingsController < ApplicationController
  before_action :set_pdf_xml_mapping, only: [:edit, :update, :destroy]

  # GET /pdf_xml_mappings
  # GET /pdf_xml_mappings.json
  def index
    @project = Project.find(params[:id])
  end

  # GET /pdf_xml_mappings/1
  # GET /pdf_xml_mappings/1.json
  def show
    @project = Project.find(params[:id])
  end

  # GET /pdf_xml_mappings/new
  def new
    @project = current_user.organization.projects.first
    @project.pdf_xml_mappings.empty? ? 2.times { @project.pdf_xml_mappings.build } : @project.pdf_xml_mappings.build
  end

  # GET /pdf_xml_mappings/1/edit
  def edit
  end

  # POST /pdf_xml_mappings
  # POST /pdf_xml_mappings.json
  def create
    @project = Project.find(params[:project][:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Pdf xml mapping was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
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
    project_id = @pdf_xml_mapping.project_id
    @pdf_xml_mapping.destroy
    respond_to do |format|
      format.html { redirect_to project_mappings_url(project_id) ,method: 'GET', notice: 'Pdf xml mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_mapping_fields
    @project = Project.find(params[:id])
    @project.pdf_xml_mappings.empty? ? 2.times { @project.pdf_xml_mappings.build } : @project.pdf_xml_mappings.build
    respond_to do |format|
      format.html { render :partial => 'mapping_fields'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf_xml_mapping
      @pdf_xml_mapping = PdfXmlMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:id, pdf_xml_mappings_attributes: [:id, :xml_node, :pdf_text, :project_id])
    end
end
