class SearchController < ApplicationController
    def search_event 
        @get_events = Event.where(" title LIKE ?", "#{params[:title]}%" )
        puts @get_events
    end
end

