# encoding: utf-8

#  Copyright (c) 2019, Pfadibewegung Schweiz. This file is part of
#  hitobito_pbs and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_pbs.

class GeolocationSerializer < ApplicationSerializer
  schema do
    json_api_properties

    property :lat, item.lat
    property :long, item.long
  end

end
