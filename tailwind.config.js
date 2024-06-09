module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/assets/images/*.png'
  ],
  theme: {
    extend: {
      backgroundImage: {
       'custom-bg': "url('app/assets/images/emblem.png)",
      }
    }
  },
  plugins: [require("daisyui")],
}
