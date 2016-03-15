#encoding: UTF-8
require 'pp'
require 'colorize'
namespace :models do
  desc 'Read Webmotors API and populate models'
  task populate: :environment do

    # print "\nGetting Webmotors models"

    time_start = DateTime.now

    #search the brands
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    # print "\nSaving models "

    # Save brands through a Rails transaction
    ActiveRecord::Base.transaction do
      # Iterate over all brands to get their models
      Brand.all.each do |brand|
        # Do request for Webmotors site
        response = Net::HTTP.post_form(uri, { marca: brand.webmotors_id })
        json = JSON.parse response.body

        # Iterate over result and save models in database
        json.each do |model_params|
          # We have learned with brand populating that the API can possible return invalid data, to avoid used the condition below
          if model_params["Id"].is_a?(Integer) and model_params["Id"] > 0
            model = Model.find_or_initialize_by(webmotors_id: model_params["Id"])
            model.assign_attributes(name: model_params['Nome'], brand: brand)
            if model.save
              print ".".colorize(:green)
            else
              pp model_params
              pp model.errors.full_messages
              raise ActiveRecord::Rollback
            end
            $stdout.flush
          end
        end
      end
    end

    print "\nFinished in #{Time.at((DateTime.now).to_i - time_start.to_i).utc.strftime("%H:%M:%S")}"
    print "\n"
  end
end