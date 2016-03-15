#encoding: UTF-8
require 'pp'
require 'colorize'
namespace :brands do
  desc 'Read Webmotors API and populate brands'
  task populate: :environment do

    print "\nGetting Webmotors brands"

    time_start = DateTime.now

    #search the brands
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Do request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    print "\nSaving brands "

    # Save brands through a Rails transaction
    ActiveRecord::Base.transaction do
      # Iterate over result and save brands in database
      json.each do |brand_params|
        # First brand have name null and id 0
        if brand_params["Id"].is_a?(Integer) and brand_params["Id"] > 0
          brand = Brand.find_or_initialize_by(webmotors_id: brand_params["Id"])
          brand.name = brand_params["Nome"]
          if brand.save
            print ".".colorize(:green)
          else
            pp brand_params
            pp brand.errors.full_messages
            raise ActiveRecord::Rollback
          end
          $stdout.flush
        end
      end
    end

    print "\nFinished in #{Time.at((DateTime.now).to_i - time_start.to_i).utc.strftime("%H:%M:%S")}"
    print "\n"

  end
end