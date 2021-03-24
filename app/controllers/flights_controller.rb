class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    if params.has_key?(:day) && params.has_key?(:month) && params.has_key?(:year)
      if params[:depart_city_id].blank?
        flash.now[:alert] = "Departure city is missing"
      elsif params[:arrive_city_id].blank?
        flash.now[:alert] = "Destination city is missing"
      elsif params[:pax].blank?
        flash.now[:alert] = "Please choose the number of passengers"
      elsif params[:depart_city_id] == params[:arrive_city_id]
        flash.now[:alert] = "Please check your input"
      else
        @selected_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
        @available_flights = Flight.where(depart_city_id: params[:depart_city_id], arrive_city_id: params[:arrive_city_id], scheduled_to_depart: @selected_date.all_day)
      end
    end 
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.fetch(:flight, {})
    end
end
