const { environment } = require('@rails/webpacker')

// const webpack = require('webpack')
// environment.plugins.append('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery'
//   })
// )

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)