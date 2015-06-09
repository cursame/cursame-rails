class Api::CctController < ApplicationController
  def municipalities
    render json: json_municipalities(params[:entity_id])
  end

  def subsystems
    render json: json_subsystems(params[:entity_id], params[:municipality_id])
  end

  def schools
    render json: json_schools(params[:entity_id], params[:municipality_id], params[:subsystem_id])
  end

  private

  def json_municipalities(entity_id)
    schools = School.find_all_by_entity_id(entity_id)
    schools.map {|s| { id: s.municipality_id, name: s.municipality_name } }.uniq.to_json
  end

  def json_subsystems(entity_id, municipality_id)
    schools = School.find_all_by_entity_id_and_municipality_id(entity_id, municipality_id)
    schools.map { |s| { id: s.subsystem, name: s.subsystem } }.uniq.to_json
  end

  def json_schools(entity_id, municipality_id, subsystem_id)
    schools = School.find_all_by_entity_id_and_municipality_id_and_subsystem(entity_id, municipality_id, subsystem_id)
    schools.map { |s| { id: s.id, name: s.name } }.to_json
  end
end
