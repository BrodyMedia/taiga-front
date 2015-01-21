window.taigaConfig = {}

defaultPromise = $.getJSON "/js/defaultConf.json"
defaultPromise.done (data) ->
    window.taigaConfig = data

    confPromise = $.getJSON "/js/conf.json"
    confPromise.done (data) ->
        window.taigaConfig = _.extend({}, window.taigaConfig, data)

    confPromise.always ->
        if window.taigaConfig.contribPlugins.length > 0
            ljs.load window.taigaConfig.contribPlugins, ->
                ljs.load "/js/app.js", ->
                    angular.bootstrap(document, ['taiga'])
        else
            ljs.load "/js/app.js", ->
                angular.bootstrap(document, ['taiga'])
