const { environment } = require('@rails/webpacker')
const path = require('path')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
    }))

module.exports = environment
