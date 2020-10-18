require_relative '../cm_challenge/absences'

require 'icalendar'

RSpec.describe 'Absences' do
  describe '#to_ical' do
    subject {CmChallenge::Absences.new.to_ical}

    it 'returns an ical file' do
      expect(subject.class).to eq(Icalendar::Calendar)
    end

    it 'has an event' do
      expect(subject.events.first).to be_instance_of Icalendar::Event
    end

    it 'has all events' do
      expect(subject.events.count).to eq(42)
    end

    it 'has the correct data in events' do
      expect(subject.events.first.dtstart.to_s).to eq("2017-01-13")
      expect(subject.events.first.dtend.to_s).to eq("2017-01-13")
      expect(subject.events.first.summary).to eq("Mike is sick.")
      
      expect(subject.events[20].dtstart.to_s).to eq("2017-06-14")
      expect(subject.events[20].dtend.to_s).to eq("2017-06-16")
      expect(subject.events[20].summary).to eq("Mike is on vacation.")
      
      expect(subject.events.last.dtstart.to_s).to eq("2017-08-05")
      expect(subject.events.last.dtend.to_s).to eq("2017-08-12")
      expect(subject.events.last.summary).to eq("Manuel is on vacation.")
      
    end
  end    
end
