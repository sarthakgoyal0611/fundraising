class SearchController < ApplicationController
    def search_event 
        @get_events = Event.all.where(" title LIKE ?", "#{params[:title]}%" )
        @get_events
    end
end

