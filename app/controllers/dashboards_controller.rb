class DashboardsController < ApplicationController
    #skip_before_action :authenticate_user!
    def index
        @projects = Project.where(user_id: current_user.id)
        
    end
    def preview
      @preview = Project.find(@project.id)
      builder = LayoutBuilder.new(@preview)
      @html = builder.build
      render :layout => false
    end
  end
  