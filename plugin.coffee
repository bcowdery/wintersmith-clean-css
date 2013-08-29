cleancss = require 'clean-css'
path     = require 'path'
fs       = require 'fs'

module.exports = (wintersmith, callback) ->

  logger = wintersmith.logger

  class CleanCssPlugin extends wintersmith.ContentPlugin

    constructor: (@_filename, @_text) ->
        
    getFilename: ->
      @_filename.relative

    render: (locals, contents, templates, callback) ->
      if @_filename.relative.indexOf('.min.css') is -1
        try
          logger.verbose "CleanCss #{@_filename.relative}"
          css = cleancss.process(@_text)
          callback null, new Buffer(css)
        catch error
          callback error
      else
        callback null, new Buffer @_text

  CleanCssPlugin.fromFile = (filename, callback) ->
    fs.readFile filename.full, (error, buffer) ->
      if error
        callback error
      else
        callback null, new CleanCssPlugin filename, buffer.toString()

  wintersmith.registerContentPlugin 'style', '**/*.css', CleanCssPlugin
  callback() # tell the plugin manager we are done
