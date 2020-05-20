class StyleBuilder
  def initialize(project)
    @project = project
  end

  def build
    html = "<style>"
    html += @project.design.css + "\n"
    # still to do font heading and paragraph overwrite
    # html += @project.font.heading + "\n"
    # still to do colors
    html += "</style>"
    html
  end
end
