require 'rails_helper'

RSpec.describe AbsenceManagerController, type: :request do

  describe '#to_ical' do
    it 'returns a succesful response' do
      get '/'
      expect(response).to be_successful
    end

    it 'downloads a calendar file' do
      get '/'
      expect(response.headers["Content-Type"]).to eq('text/calendar')
    end
  
  end
end
      
    