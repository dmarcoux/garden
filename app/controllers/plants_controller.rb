# frozen_string_literal: true

class PlantsController < ApplicationController
  respond_to :html, :json
  before_action :set_plant, only: %i[show edit update destroy]

  # GET /plants or /plants.json
  def index
    @plants = Plant.all
  end

  # GET /plants/1 or /plants/1.json
  def show; end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit; end

  # POST /plants or /plants.json
  def create
    @plant = Plant.create(plant_params)

    respond_with(@plant)
  end

  # PATCH/PUT /plants/1 or /plants/1.json
  def update
    @plant.update(plant_params)

    respond_with(@plant)
  end

  # DELETE /plants/1 or /plants/1.json
  def destroy
    @plant.destroy

    respond_with(@plant)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_plant
    @plant = Plant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def plant_params
    params.require(:plant).permit(:common_name, :latin_name, :germination_temperature_minimum,
                                  :germination_temperature_maximum, :planting_depth)
  end
end
