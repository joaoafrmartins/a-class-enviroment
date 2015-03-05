Mixto = require 'mixto'

class AClassEnviroment extends Mixto

  constructor: (@options={}) ->

    super @options

  extended: () ->

    @options ?= {}

    @options.enviromentPrefix ?= "npm_package_config_"

    @options.enviromentVariables ?= {}

    env = null

    Object.defineProperty @, "env",

      writeable: false

      get: () ->

        if env is null

          env = {}

          prefix = @options.enviromentPrefix

          variables = @options.enviromentVariables

          for variable, defaultValue of variables

            env["#{variable}"] = process.env["#{prefix}#{variable}"]

            env["#{variable}"] ?= defaultValue

        return env

module.exports = AClassEnviroment
