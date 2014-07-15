# coding: utf-8
require 'rails_helper'

RSpec.describe Grade, :type => :model do

  it "Grade no acepta qualifying nulls" do

    grade = Grade.create
    
    expect(grade.save).to be(false)     
  end

  it "Score no acepta nulos" do

    vars = set_enviroment_for_grade
    grade = Grade.create(qualifying: vars[:user_survey])

    expect(grade.save).to eq(false)
  end
  
  it "Score no acepta números negativos" do

    vars = set_enviroment_for_grade
    grade = Grade.create(qualifying: vars[:user_survey], score: -1)
    
    expect(grade.save).to eq(false)
  end
  
  it "Score no acepta números mayores a 100" do
    
    vars = set_enviroment_for_grade
    grade = Grade.create(qualifying: vars[:user_survey], score: 101)
    
    expect(grade.save).to eq(false)
  end

  it "Grade verifica si qualifying existe" do
    vars = set_enviroment_for_grade
    grade = Grade.create(qualifying_type: "UserSurvey", qualifying_id: (vars[:user_survey].id + 100), score: 100)

    expect(grade.save).to eq(false)
  end
  
  
  it "Si Grade es destruido, su UserSurvey debera existir"  do
    
    vars = set_enviroment_for_grade
    grade = Grade.create(qualifying: vars[:user_survey], score: 50)
    
    grade.destroy
    
    expect(UserSurvey.find_by_id(vars[:user_survey].id)).to eq(vars[:user_survey])
    
  end

  it "Si destruyo UserSurvey, Grade tambien debe destruirse" do

    vars = set_enviroment_for_grade
    grade = Grade.create(qualifying: vars[:user_survey], score: 50)

    vars[:user_survey].destroy

    expect(nil).to be(Grade.find_by_id(grade.id))
  end
end
