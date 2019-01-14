module Api::V1
  class PropertiesController < ApplicationController
    # GET /properties
    def index
  	  @properties = Property.all
  	  render json: @properties, each_serializer: ::V1::PropertySerializer, status:200
    end
  end
end
