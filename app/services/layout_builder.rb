class LayoutBuilder
  def initialize(layout)
    @layout = layout
  end

  def build
    components_order = ""
    # TODO: Actually concatenate in right order
    @layout.components.each do |c|
      components_order << ComponentBuilder.new(c).build
    end
    html = <<~HTML
      <head>
        <meta charset="UTF-8">
        <title>Document</title>
        #{StyleBuilder.new(@layout).build}
      </head>
      <body>
        #{components_order}
      </body>
    HTML
    html
  end
end
