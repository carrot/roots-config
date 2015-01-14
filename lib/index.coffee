RootsUtil = require 'roots-util'
path      = require 'path'

module.exports = (opts) ->
  class RootsConfig

    constructor: (@roots) ->
      @roots.config.locals ?= {}
      @roots.config.locals.config = opts
      @roots.config.locals.config_js = ->
        "<script>window.config = #{JSON.stringify(opts)}</script>"
