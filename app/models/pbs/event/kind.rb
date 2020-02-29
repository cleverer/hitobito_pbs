# encoding: utf-8

#  Copyright (c) 2012-2019, Pfadibewegung Schweiz. This file is part of
#  hitobito_pbs and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_pbs.

module Pbs::Event::Kind
  extend ActiveSupport::Concern

  included do
    translates :documents_text

    validates :confirmation_name, presence: true, if: -> { can_have_confirmations? }
  end
end
