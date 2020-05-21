class LayoutBuilder
  def initialize(project)
    @project = project
  end

  # def build
  #   components_order = ""
  #   # TODO: Actually concatenate in right order
  #   @layout.components.each do |c|
  #     components_order << ComponentBuilder.new(c).build
  #   end
  #   html = <<~HTML
  #     <head>
  #       <meta charset="UTF-8">
  #       <title>Document</title>
  #       #{StyleBuilder.new(@layout).build}
  #     </head>
  #     <body>
  #       #{components_order}
  #     </body>
  #   HTML
  #   html
  # end

  def build
    html = @project.layout.html
    @project.placeholders.each do |ph|
      html.gsub!("{{{#{ph.name}}}}", ph.value)
    end
    final_html = <<~HTML
      <head>
        <meta charset="UTF-8">
        <title>Document</title>
        #{StyleBuilder.new(@project).build}
      </head>
      <body>
        #{html}
      </body>
    HTML
    final_html
  end
end
