cleancss = require 'clean-css'
path     = require 'path'
fs       = require 'fs'

module.exports = (wintersmith, callback) ->

  logger = wintersmith.logger

  class CleanCssPlugin extends wintersmith.ContentPlugin

    constructor: (@_filename, @base_, @_text) ->

    getFilename: ->
      @_filename

    render: (locals, contents, templates, callback) ->
      if @_filename.indexOf('.min.css') is -1
        try
          logger.verbose "CleanCss #{@_filename}"
          css = cleancss.process(@_text)
          callback null, new Buffer(css)
        catch error
          callback error

  CleanCssPlugin.fromFile = (filename, base, callback) ->
    fs.readFile path.join(base, filename), (error, buffer) ->
      if error
        callback error
      else
        callback null, new CleanCssPlugin filename, base, buffer.toString()

  wintersmith.registerContentPlugin 'style', '**/*.css', CleanCssPlugin
  callback() # tell the plugin manager we are done