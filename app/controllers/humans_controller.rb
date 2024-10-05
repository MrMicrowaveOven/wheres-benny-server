class HumansController < ApplicationController
    def update
        name = human_params['name']
        human = Human.find_by_name(name)
        if human
            human.update(lat: human_params['lat'], lng: human_params['lng'], location_last_updated: Time.now)
        else
            human = Human.create(name: human_params['name'], lat: human_params['lat'], lng: human_params['lng'], location_last_updated: Time.now)
        end
        human.check_location
        render :json => human
    end

    private
    def human_params
      params.require(:human).permit(:name, :lat, :lng)
    end
end
