Style.destroy_all
Layout.destroy_all

blog = Layout.create!(
  name: "Influencer's blog"
)

Placeholder.destroy_all
Component.destroy_all

html = <<~HTML
  <div>
    <div>{{{heading_date}}}</div>
    <h1 class="heading_style">{{{heading_text}}}</h1>
  </div>
HTML

h1 = Component.create!(
  name: "h1",
  kind: "main_heading",
  html: html
)

h1.placeholders.create!(
  name: "heading_text",
  value: "Influencer's Little Blog"
)

h1.placeholders.create!(
  name: "heading_date",
  value: "May 11, 2011"
)

# Create style

css = <<~CSS
  .heading_style {
    color: red;
  }
CSS

blog.styles.create!(
  name: "big_red_heading",
  css: css,
  order: 0
)

style = blog.styles.first
style.components << h1
