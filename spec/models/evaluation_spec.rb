# coding: utf-8
require 'rails_helper'

RSpec.describe Evaluation, :type => :model do

  it "Evaluation no acepta qualifying nulls" do

    evaluation = Evaluation.create
    
    expect(evaluation.save).to be(false)     
  end

  it "Score no acepta nulos" do

    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying: vars[:user_survey])

    expect(evaluation.save).to eq(false)
  end
  
  it "Score no acepta números negativos" do

    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying: vars[:user_survey], score: -1)
    
    expect(evaluation.save).to eq(false)
  end
  
  it "Score no acepta números mayores a 100" do
    
    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying: vars[:user_survey], score: 101)
    
    expect(evaluation.save).to eq(false)
  end

  it "Evaluation verifica si qualifying existe" do
    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying_type: "UserSurvey", qualifying_id: (vars[:user_survey].id + 100), score: 100)

    expect(evaluation.save).to eq(false)
  end
  
  
  it "Si Evaluation es destruido, su UserSurvey debera existir"  do
    
    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying: vars[:user_survey], score: 50)
    
    evaluation.destroy
    
    expect(UserSurvey.find_by_id(vars[:user_survey].id)).to eq(vars[:user_survey])
    
  end

  it "Si destruyo UserSurvey, Evaluation tambien debe destruirse" do

    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying: vars[:user_survey], score: 50)

    vars[:user_survey].destroy

    expect(nil).to be(Evaluation.find_by_id(evaluation.id))
  end
end
