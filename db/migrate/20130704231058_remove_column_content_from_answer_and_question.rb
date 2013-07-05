class RemoveColumnContentFromAnswerAndQuestion < ActiveRecord::Migration
  def up
    answers = Answer.all
    questions = Question.all

    answers_content = answers.map{ |a| [a.id,a.content] }
    questions_content = questions.map { |q| [q.id,q.content] }

    remove_column :answers, :content
    remove_column :questions, :content

    add_column :answers, :content, :text
    add_column :questions, :content, :text

    answers_content.each do
      |array|
      answer = Answer.find(array.first)
      answer.content = array.last
      answer.save!
    end

    questions_content.each do
     |array|
      question = Question.find(array.first)
      question.content = array.last
      question.save!
    end

  end

  def down
  end
end
