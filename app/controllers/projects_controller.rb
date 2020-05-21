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
  end

  def update
    @project = Project.find(params["id"])
    redirect_to generate_path(project_id: @project.id)
  end

  def preview
    @preview = Project.find(params[:project_id])
    builder = LayoutBuilder.new(@preview)
    @html = builder.build
    render :layout => false
  end

  private
  def project_params
    params.require(:project).permit(:id, :logo, :layout_id, :design_id, :font_id, :color_id, :placeholder_id)
  end
end