class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy  ]

  # before_action :authenticate_user!, only: %i[edit update destroy ]
  # before_action :check_is_admin, only: %i[edit update destroy ]
  # GET /events or /events.json
  def index
    if current_user && current_user.is_admin 
       @events = Event.all
    elsif current_user
      # @events = Event.all.where({is_visible: true}) && @events = Event.all.where({is_completed: false})
        @events = Event.all.where({is_visible: true}).or(Event.where({status: 'active'}))
    else
        @events = Event.all.where({ status: 'active'})
    end
  end
  #   @q = Event.ransack(params[:q])
  # @events = @q.result(distinct: true)
  # GET /events/1 or /events/1.json

  def show
  end
  
   def search_event 
      if current_user && current_user.is_admin
          @get_events = Event.all.where(" title LIKE ?", "%#{params[:title]}%" )
      else      
        @get_events = Event.all.where(" title LIKE ?", "%#{params[:title]}%" ).where({status: 'active'})
      end
  end



  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end


  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :Amount, :date, :photograph, :is_visible, :expiry_date, :status)
    end


  def check_is_admin
    # if current_user.is_admin == false
    #   redirect_to root_path
    # end
  end 
  

end
