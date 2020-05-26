class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new update preview]
  skip_before_action :verify_authenticity_token, only: :update

  def new
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
    else
      if current_user.nil?
        @project = Project.create(layout_id: Layout.first.id, color_id: Color.first.id, design_id: Design.first.id, user_id: User.first.id, font_id: Font.first.id)
      else
        @project = Project.create(layout_id: Layout.first.id, color_id: Color.first.id, design_id: Design.first.id, user_id: current_user.id, font_id: Font.first.id)
      end
    end
    @fonts = FontList.list
    # raise
    logger.info "Processing the request..."
  end

  def update
    @project = Project.find(params["id"])
    #@project.update(logo: project_params[:logo])
    @project.update(layout_id: project_params[:layout_id])
    @project.update(design_id: project_params[:design_id])
    @project.update(color_id: project_params[:color_id])
    #raise
    font = Font.find_by(heading: font_params[:heading], paragraph: font_params[:paragraph])
    if font.nil?
      font = Font.create(heading: font_params[:heading], paragraph: font_params[:paragraph])
    end
    @project.update(font_id: font.id)

    redirect_to generate_path(project_id: @project.id)
  end

  def save
    raise
      if @project.save
        flash[:success] = "Layout is saved to your dashboard!"
        redirect_to dashboard_path
        raise
      else
        flash[:alert] = "Something went wrong. Please try again!"
        redirect_to new_path(@project)
        raise
      end
  end

  def preview
    @preview = Project.find(params[:project_id])
    builder = LayoutBuilder.new(@preview)
    @html = builder.build
    render :layout => false
  end

  private
  def project_params
    # :logo, was in params, now is commented out beacause logo upload button is ugly
    params.require(:project).permit(:layout_id, :design_id, :font_id, :color_id, :placeholder_id)
  end
  def font_params
    params.require(:font).permit(:heading, :paragraph)
  end
end
