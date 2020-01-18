# frozen_string_literal: true

class Api::QuestionsController < ApplicationController
  respond_to :json

  def index
    respond_with Question.order(event_date: :DESC)
  end

  def show
    respond_with Question.find(params[:id])
  end

  def create
    respond_with :api, Question.create(event_params)
  end

  def destroy
    respond_with Question.destroy(params[:id])
  end

  def update
    event = Question.find(params['id'])
    event.update(event_params)
    respond_with Question, json: event
  end

    private

  def event_params
    params.require(:event).permit(
      :id,
      :module_code,
      :question_body,
      :answer_body,
      :answered,
      :asker_id
    )
  end
  end
