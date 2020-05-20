class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    @project = Project.new
    #@project.user_id = current_user
  end

  private
  def project_params

  end
end
