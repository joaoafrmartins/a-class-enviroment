describe 'AClassEnviroment', () ->

  it 'before', () ->

    kosher.alias 'AClassEnviroment'

  describe 'properties', () ->

    describe 'env', () ->

      it 'should be able to read enviroment variables', () ->

        process.env.npm_package_config_hello = "world"

        class Mock

          constructor: (@options={}) ->

            @options.enviromentVariables =

              "hello": "defaultValue"

            kosher.AClassEnviroment.extend @

        kosher.alias 'instance', new Mock

        kosher.instance.env.hello.should.eql "world"
