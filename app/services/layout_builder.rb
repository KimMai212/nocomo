class LayoutBuilder
  def initialize(project)
    @project = project
  end

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
        <script src="https://kit.fontawesome.com/a1a0676a70.js" crossorigin="anonymous"></script>
      </head>
      <body>
        #{html}
      </body>
    HTML
    # unless @project.logo.nil?
    #   final_html.gsub!(/^(<img src=").*(" class="logo">)$/, "<img src='#{@project.logo.key}' class='logo'")
    # end
    final_html
  end
end
