module Theme1
  class ProgramsController < ApplicationController
    def index
      response = RestClient.get('http://localhost:3000/api/v1/programs')
      @programs = JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      @error = "Error fetching programs: #{e.response}"
      @programs = []
    end

    def show
      response = RestClient.get("http://localhost:3000/api/v1/programs/#{params[:id]}")
      @program = JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      redirect_to programs_path, alert: 'Program not found'
    end
  end
end
