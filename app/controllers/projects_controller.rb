class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new update preview]
  skip_before_action :verify_authenticity_token, only: :update

  def new
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
    else
      @project = Project.create(layout_id: Layout.first.id, color_id: Color.first.id, design_id: Design.first.id, user_id: User.first.id, font_id: Font.first.id)
    end
    @fonts = FontList.list
    #raise
  end

  def update
    @project = Project.find(params["id"])
    @project.update(layout_id: project_params[:layout_id])
    @project.update(design_id: project_params[:design_id])
    @project.update(color_id: project_params[:color_id])

    font = Font.find_by(heading: font_params[:heading], paragraph: font_params[:paragraph])
    if font.nil?
      font = Font.create(heading: font_params[:heading], paragraph: font_params[:paragraph])
    end
    @project.update(font_id: font.id)

    redirect_to generate_path(project_id: @project.id)
    #raise
  end

  def preview
    @preview = Project.find(params[:project_id])
    builder = LayoutBuilder.new(@preview)
    @html = builder.build
    render :layout => false
  end

  private
  def project_params
    params.require(:project).permit(:logo, :layout_id, :design_id, :font_id, :color_id, :placeholder_id)
  end
  def font_params
    params.require(:font).permit(:heading, :paragraph)
  end
end
