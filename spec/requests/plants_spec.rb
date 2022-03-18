# frozen_string_literal: true

require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/plants", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Plant. As you add validations to Plant, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      common_name: "My common name",
      latin_name: "My latin name",
      germination_temperature_minimum: 1,
      germination_temperature_maximum: 2,
      planting_depth: 3
    }
  end

  let(:invalid_attributes) do
    {
      common_name: "",
      latin_name: nil,
      germination_temperature_minimum: 2,
      germination_temperature_maximum: 1,
      planting_depth: 999
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Plant.create! valid_attributes
      get plants_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      plant = Plant.create! valid_attributes
      get plant_url(plant)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_plant_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      plant = Plant.create! valid_attributes
      get edit_plant_url(plant)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Plant" do
        expect do
          post plants_url, params: { plant: valid_attributes }
        end.to change(Plant, :count).by(1)
      end

      it "redirects to the created plant" do
        post plants_url, params: { plant: valid_attributes }
        expect(response).to redirect_to(plant_url(Plant.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Plant" do
        expect do
          post plants_url, params: { plant: invalid_attributes }
        end.to change(Plant, :count).by(0)
      end

      it "renders errors" do
        post plants_url, params: { plant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("errors prohibited this plant from being created.")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested plant" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: new_attributes }
        plant.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the plant" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: new_attributes }
        plant.reload
        expect(response).to redirect_to(plant_url(plant))
      end
    end

    context "with invalid parameters" do
      it "renders errors" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("errors prohibited this plant from being updated.")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested plant" do
      plant = Plant.create! valid_attributes
      expect do
        delete plant_url(plant)
      end.to change(Plant, :count).by(-1)
    end

    it "redirects to the plants list" do
      plant = Plant.create! valid_attributes
      delete plant_url(plant)
      expect(response).to redirect_to(plants_url)
    end
  end
end
