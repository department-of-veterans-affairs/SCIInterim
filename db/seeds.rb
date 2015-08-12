# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Populate domain data
require 'domain_seeds'
DomainSeeds.seed_all

ASIA = ["High-tetra", "Low-tetra", "parapalegia", "multiple scaroliosis"]

#populate facilities
  #TODO: add additional data to fields

  facilities_list = [
  [ "Long Beach", "Long Beach SCI Center"],
  [ "Palo Alto", "Palo Alto SCI Center"],
  [ "San Diego", "San Diego SCI Center"],
  [ "Miami", "Miami SCI Center"],
  [ "Tampa", "Tampa SCI Center"],
  [ "Augusta", "Augusta SCI Center"],
  [ "Hines", "Edward Hines VA SCI Center"],
  [ "Boston", "Boston SCI Center"],
  [ "Minneapolis", "Minneapolis SCI Center"],
  [ "St. Louis", "Jefferson Barracks Division"],
  [ "East Orange", "New Jersey Healthcare System"],
  [ "Albuquerque", "Albuquerque Medical Center"],
  [ "Bronx", "Bronx SCI Center"],
  [ "Castle Point", "Castle Point Healthcare System"],
  [ "Syracuse", "Syracuse SCI Center"],
  [ "Cleveland", "Cleveland SCI Center"],
  [ "Memphis", "Memphis SCI Center"],
  [ "Dallas", "Dallas SCI Center"],
  [ "Houston", "Houston SCI Center"],
  [ "San Antonio", "South Texas Veterans Health Care System"],
  [ "Hampton", "Hampton SCI Center"],
  [ "Richmond", "Richmond SCI Center"],
  [ "Seattle", "Seattle SCI Center"],
  [ "Milwaukee", "Milwaukee SCI Center"],
  [ "San Juan", "San Juan SCI Center"]
]

facilities_list.each do |city_name, official_name|
  Facility.create( city_name: city_name, official_name: official_name )
end
