# frozen_string_literal: true

class Api::QuestionsController < ApplicationController
  respond_to :json

  def index
    respond_with Question.all
  end

  def show
    respond_with Question.find(params[:id])
  end

  def create
    respond_with :api, Question.create(question_params)
  end

  def destroy
    respond_with Question.destroy(params[:id])
  end

  def update
    question = Question.find(params['id'])
    question.update(question_params)
    respond_with Question, json: question
  end

    private

  def question_params
    params.require(:question).permit(
      :id,
      :module_code,
      :question_body,
      :answer_body,
      :answered,
      :asker_id
    )
  end
end
