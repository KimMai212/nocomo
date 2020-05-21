class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new preview]

  def new
    @new = Project.new
    @project = Project.create(layout_id: Layout.first.id, color_id: Color.first.id, design_id: Design.first.id, user_id: User.first.id, font_id: Font.first.id)
  end

  def update
    @project = Project.find(params[:id])
    p = @project.update!(project_params)
    redirect_to '/generate'
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