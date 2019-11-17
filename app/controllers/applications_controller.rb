# frozen_string_literal: true

# app/controllers/applications_controller.rb
# @todo add filteration and sanitization
class ApplicationsController < ApplicationController
  # GET /applications
  def index
    @apps = Application.all
    json_response(@apps)
  end

  # POST /applications
  def create
    @app = Application.create!(app_params)
    json_response(@app, :created)
  end

  # GET /applications/:key
  def show
    @app = Application.find_by(key: params[:id])
    json_response(@app)
  end

  # PUT /applications/:key
  def update
    Application.update(app_params)
    head :no_content
  end

  def app_params
    params.permit(:name)
  end
end
