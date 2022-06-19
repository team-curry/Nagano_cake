const { environment } = require('@rails/webpacker')
 
 

module.exports = environment

const webpack = require('webpack')
<<<<<<< HEAD
 environment.plugins.prepend(
=======
environment.plugins.prepend(
>>>>>>> develop2
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
<<<<<<< HEAD
 )
=======
)
>>>>>>> develop2
