# Style.destroy_all

Project.destroy_all
Layout.destroy_all

# blog = Layout.create!(
#   name: "Influencer's blog"
# )

Placeholder.destroy_all
# Component.destroy_all
leon = User.new(email: "test@test.de", password: "123456")

html = <<~HTML
  <nav>
     <div>
        <img src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png" class="logo">
      </div>
    </nav>
    <div class="main">
      <div class="banner" style="background-image: linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)), url(https://source.unsplash.com/random);">
        <div class="container">
          <h1>Le Wagon brings creative people!</h1>
        </div>
      </div>

      <h1 class="main-heading">{{{main_heading}}}</h1>
      <div class="row">
        <div class="col-6">
          <p>Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.</p>
        </div>
        <div class="col-6">
          <p>Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.</p>
        </div>
      </div>
      <a href="#" class="btn">Click here!</a>
      <h2>Some headline</h2>
      <div class="card-wrapper">
        <div class="card">
          <img src="https://source.unsplash.com/random/200x200" />
          <div class="card-product-infos">
            <h3>This is a card</h3>
            <p>Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime.</p>
          </div>
        </div>
        <div class="card">
          <img src="https://source.unsplash.com/random/200x200" />
          <div class="card-product-infos">
            <h3>This is a card</h3>
            <p>Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime.</p>
          </div>
        </div>
        <div class="card">
          <img src="https://source.unsplash.com/random/200x200" />
          <div class="card-product-infos">
            <h3>This is a card</h3>
            <p>Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime.</p>
          </div>
        </div>
        <div class="card">
          <img src="https://source.unsplash.com/random/200x200" />
          <div class="card-product-infos">
            <h3>This is a card</h3>
            <p>Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime.</p>
          </div>
        </div>
      </div>
      <h2>Some headline</h2>
      <p>Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.</p>
      <a href="#" class="btn">Click here!</a>
    </div>
    <footer>
      <p>Made with something, somewhere</p>
    </footer>
HTML

business = Layout.create!(
  name: "business",
  html: html
)


# Create style

css = <<~CSS
  /* Main styling */
      body {
        padding: 0;
        margin: 0;
      }
      nav {
        width: 100%;
        padding: 10px 0;
        text-align: center;
        background-color: #49a;
        height: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #business nav div {
        width: 100%;
        max-width: 900px;
        margin: auto;
        text-align: left;
      }

      .logo {
        width: 40px;
      }

      .main {
        max-width: 900px;
        margin: auto;
      }

      footer {
        width: 100%;
        margin: 60px 0 0;
        text-align: center;
        color: #fff;
        background-color: #49a;
        padding: 50px 0;
      }

      .row {
        display: flex;
      }

      .col-6 {
        width: 50%;
      }
      .col-6:first-child {
        padding-right: 15px;
      }
      .col-6:last-child {
        padding-left: 15px;
      }

      /* Banner */
      .banner {
        background-size: cover;
        background-position: center;
        padding: 150px 50px;
      }
      .banner h1 {
        margin: 0;
        color: white;
        text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
        font-size: 32px;
        font-weight: bold;
      }

      /* Main Heading */
      .main-heading {
        color: #000;
        text-align: center;
        font-size: 48px;
        line-height: 1.2;
      }

      /* Paragraph */
      .paragraph {
        text-align: left;
        font-size: 18px;
        line-height: 1.2;
      }

      /* Button */

      .btn {
        padding: 10px 20px;
        background-color: #49a;
        border-color: #49a;
        border-radius: 2px;
        text-decoration: none;
        color: #fff;
        transition: all .3s;
        display: inline-block;
      }

      .btn:hover {
        background-color: #278;
      }

      /* Cards */
      .card-wrapper {
        display: flex;
        flex-direction: row;
      }

      .card-wrapper .card {
        margin: 15px;
      }
      .card-wrapper .card:first-child {
        margin-left: 0;
      }
      .card-wrapper .card:last-child {
        margin-right: 0;
      }

      .card {
        overflow: hidden;
        background: white;
        box-shadow: 0 0 15px rgba(0,0,0,0.2);
        display: flex;
        flex-direction: column;
        align-items: center;
        max-width: 300px;
      }

      .card img {
        height: 100%;
        width: 100%;
        object-fit: cover;
      }

      .card h2 {
        font-size: 24px;
        font-weight: bold;
        margin: 0;
      }

      .card p {
        font-size: 16px;
        line-height: 1.4;
        opacity: .7;
        margin-bottom: 0;
        margin-top: 8px;
      }

      .card .card-product-infos {
        padding: 10px 20px 20px;
      }
CSS

business_design = Design.create!(
  name: "business_design",
  css: css,
)

#  Create Color
color_css = <<~CSS
  p {
    color: black;
  }
CSS

color = Color.create!(
  name: "dark_design",
  css: color_css,
)



font = Font.create!(
  paragraph: "Varela Round",
  heading: "Lato",
)

project = Project.new
project.design = dark_design
project.layout = h1
project.user = leon
project.color = color
project.font = font
project.save!

project.placeholders.create!(
  name: "heading_date",
  value: "May 11, 2011"
)





# style = blog.styles.first
# style.components << h1



