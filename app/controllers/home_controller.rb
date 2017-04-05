require 'darksky'
Darksky::API::DARKSKY_API_URL = 'https://api.darksky.net'



class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:postSensorData]
  skip_before_action :verify_authenticity_token, only: [:postSensorData]

  def index
    darksky = Darksky::API.new('711967c9933dc311b0b67a343c18f8fb')

    @forecast = darksky.forecast('-4.073249','39.676968')
    render 'index'
  end

  def arduino
    render 'arduino'
  end

  def getMoistureData
    @m = Sensor.last.moisture
    render json: @m
  end

  def getVoltageData
    @v = Sensor.last.voltage
    render json: @v
  end

  def parmas
    params.require(:data).permit(:moisture, :voltage)
end

  def postSensorData
      @data = Sensor.new(parmas)

      respond_to do |format|
        if @data.save
          format.json {render status: 200, json: @controller.to_json}
        else
          format.json {render status: 400, json: @controller.to_json}
        end
      end
    end
end
