require_relative './api'

require 'icalendar'

module CmChallenge
  class Absences
    
    def initialize
      @members  = CmChallenge::Api.members
      @absences = CmChallenge::Api.absences
      @absent_list = CmChallenge::Api.get_absence_list # Contains The list of absences along with names.
    end

    def to_ical     
      cal = Icalendar::Calendar.new
      @absent_list.each do |absence|
        cal.event do |e|
          #Remove '-' and replace with ''
          e.dtstart     = Icalendar::Values::Date.new(absence[:start_date].gsub('-', ''))
          e.dtend       = Icalendar::Values::Date.new(absence[:end_date].gsub('-', ''))
          e.summary     = get_summary(absence[:name], absence[:type])        
        end
        cal.publish
      end
      return cal
    end

    def get_summary name, type
      if type.eql?("vacation")
        return "#{name} is on vacation."
      elsif type.eql?("sickness")
        return "#{name} is sick."
      else
        return "#{name} is absent due to unknown reason."
      end
    end

  end
end