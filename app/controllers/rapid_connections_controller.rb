# frozen_string_literal: true

class RapidConnectionsController < ApplicationController
  before_action :set_rapid_connection, only: %i[show edit update destroy]

  # GET /rapid_connections or /rapid_connections.json
  def index
    @rapid_connections = RapidConnection.order(:created_at)
  end

  # GET /rapid_connections/1 or /rapid_connections/1.json
  def show; end

  # GET /rapid_connections/new
  def new
    @rapid_connection = RapidConnection.new
  end

  # GET /rapid_connections/1/edit
  def edit; end

  # POST /rapid_connections or /rapid_connections.json
  def create
    @rapid_connection = RapidConnection.new(rapid_connection_params)

    respond_to do |format|
      if @rapid_connection.save
        format.html do
          redirect_to rapid_connection_url(@rapid_connection), notice: 'Rapid connection was successfully created.'
        end
        format.json { render :show, status: :created, location: @rapid_connection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rapid_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rapid_connections/1 or /rapid_connections/1.json
  def update
    respond_to do |format|
      if @rapid_connection.update(rapid_connection_params)
        format.html do
          redirect_to rapid_connection_url(@rapid_connection), notice: 'Rapid connection was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @rapid_connection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rapid_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rapid_connections/1 or /rapid_connections/1.json
  def destroy
    @rapid_connection.destroy

    respond_to do |format|
      format.html { redirect_to rapid_connections_url, notice: 'Rapid connection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rapid_connection
    @rapid_connection = RapidConnection.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rapid_connection_params
    params.require(:rapid_connection).permit(:nickname, :secret, :callback_url, :preferred_entity_id)
  end
end
