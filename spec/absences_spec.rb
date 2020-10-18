require_relative '../app/models/absences'

require 'icalendar'

RSpec.describe 'Absences' do

  describe '#initialize' do
    subject(:s1) {CmChallenge::Absences.new({userId:644}).to_ical}
    it 'has the absence data of Mike' do
      expect(s1.events.first.dtstart.to_s).to eq("2017-01-13")
      expect(s1.events.first.dtend.to_s).to eq("2017-01-13")
      expect(s1.events.first.summary).to eq("Mike is sick.")
    end
    subject(:s2) {CmChallenge::Absences.new({startDate:"2017-01-01", endDate: "2017-02-01"}).to_ical}
    it 'has absences only in between the given dates' do
      s2.events do |e|
        expect(e.dtstart.to_s).to be > "20170101"
        expect(e.dtend.to_s).to be > "20170201"
        expect(e.dtend.to_s).to be >= e.dtstart.to_s
      end
    end
    subject(:s3) {CmChallenge::Absences.new({userId:644, startDate:"2017-01-01", endDate: "2017-02-01"}).to_ical}
    it 'can take both user id and dates as parmeters' do
      expect(s1.events.first.dtstart.to_s).to eq("2017-01-13")
      expect(s1.events.first.dtend.to_s).to eq("2017-01-13")
      expect(s1.events.first.summary).to eq("Mike is sick.")
    end
  end

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
