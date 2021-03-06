class StyleBuilder
  def initialize(project)
    @project = project
  end

  def build
    heading = @project.font[:heading]
    paragraph = @project.font[:paragraph]
    if heading == paragraph
      import_font = "@import url('https://fonts.googleapis.com/css2?family=#{heading.gsub(" ", "+")}&display=swap');"
    else
      import_font = "@import url('https://fonts.googleapis.com/css2?family=#{heading.gsub(" ", "+")}&family=#{paragraph.gsub(" ", "+")}&display=swap');"
    end
    html = "<style>"
    html += import_font
    html += @project.design.css + "\n"
    html += <<~CSS
      h1, h2, h3, h4, h5 {
        font-family: #{heading};
      }
      p,
      .btn {
        font-family: #{paragraph};
      }
    CSS
    html += @project.color.css
    html += "</style>"
    html
  end
end
