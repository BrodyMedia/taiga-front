###
# Copyright (C) 2014 Andrey Antukh <niwi@niwi.be>
# Copyright (C) 2014 Jesús Espino Garcia <jespinog@gmail.com>
# Copyright (C) 2014 David Barragán Merino <bameda@dbarragan.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: modules/base/conf.coffee
###

defaults = {
    api: "http://localhost:8000/api/v1/"
    debug: true
    lang: "en"
}

class ConfigurationService
    @.$inject = ["localconf"]

    constructor: (localconf) ->
        @.config = _.merge(_.clone(defaults, true), localconf)

    get: (key, defaultValue=null) ->
        if _.has(@.config, key)
            return @.config[key]
        return defaultValue


module = angular.module("taigaBase")
module.service("$tgConfig", ConfigurationService)
module.value("localconf", null)
