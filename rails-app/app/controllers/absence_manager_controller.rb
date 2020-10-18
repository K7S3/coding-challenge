require_relative "../models/absences"

class AbsenceManagerController < ApplicationController
  
  def download_ical
    # render 'absence_manager/download_ical'
    parames =  params.permit(:userId, :startDate, :endDate).to_hash
    cal = CmChallenge::Absences.new(parames).to_ical
    filename = "absences#{parames}"
    
    if params[:format] == 'vcs' # Outlook Version
      cal.prodid = '-//Microsoft Corporation//Outlook MIMEDIR//EN'
      cal.version = '1.0'
      filename += '.vcs'
    else # ical Version
      cal.prodid = '-//Acme Widgets, Inc.//NONSGML ExportToCalendar//EN'
      cal.version = '2.0'
      filename += '.ics'
    end
    
    send_data cal.to_ical, type: 'text/calendar',  filename: filename
  
  end
end
