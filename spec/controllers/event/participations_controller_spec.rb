# encoding: utf-8

#  Copyright (c) 2012-2015, Pfadibewegung Schweiz. This file is part of
#  hitobito_pbs and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_pbs.

require 'spec_helper'

describe Event::ParticipationsController do

  let(:group) { course.groups.first }
  let(:course) { Fabricate(:pbs_course, groups: [groups(:bund)]) }

  context 'GET new' do
    it 'informs about email sent to participant' do
      sign_in(people(:bulei))
      get :new, group_id: group.id, event_id: course.id, event_participation: { person_id: people(:child).id }
      expect(flash[:notice]).to be_present
    end
  end

  context 'POST create' do
    it 'creates confirmation job when creating for other user' do
      sign_in(people(:bulei))
      expect do
        post :create, group_id: group.id, event_id: course.id, event_participation: { person_id: people(:child).id }
        expect(assigns(:participation)).to be_valid
      end.to change { Delayed::Job.count }.by(1)
      expect(flash[:notice]).not_to include 'Für die definitive Anmeldung musst du diese Seite über <i>Drucken</i> ausdrucken, '
    end
  end

end