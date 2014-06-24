require 'rails_helper'

RSpec.describe Evaluation, :type => :model do

  it "Evaluation no acepta qualifying nulls" do

    evaluation = Evaluation.create
    
    expect(evaluation.save).to be(false)     
  end

  it "Score debe ser 0 si no se le indica nada" do

    evaluation = Evaluation.create

    expect(evaluation.score).to eq(0)
  end
  
  it "Score debe ser 0 si se le pasa un numero negativo" do

    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create!(qualifying: vars[:assignment], score: -1)

    expect(evaluation.score).to eq(0)
  end

  it "Score debe ser 100 si se le pasa un numero mayor a 100" do

    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying: vars[:assignment], score: 101)

    expect(evaluation.score).to eq(100)
  end


  it "Si Evaluation es destruido, su Assignment debera existir"  do

    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying: vars[:assignment], score: 101)

    evaluation.destroy

    expect(Assignment.find_by_id(vars[:assignment].id)).to eq(vars[:assignment])
    
  end

  it "Si destruyo Assignment, Evaluation tambien debe destruirse" do

    vars = set_enviroment_for_evaluation
    evaluation = Evaluation.create(qualifying: vars[:assignment], score: 101)

    vars[:assignment].destroy

    expect(nil).to be(Evaluation.find_by_id(evaluation.id))
  end
end
