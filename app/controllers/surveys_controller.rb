class SurveysController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_coordinator, only: [:new, :create, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
    render json: @surveys
  end

  def create
    @survey = Survey.new(survey_params)
    authorize @survey  # Verifica se o usuário tem permissão para criar
    if @survey.save
      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  def update
    @survey = Survey.find(params[:id])
    authorize @survey  # Verifica se o usuário tem permissão para atualizar
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    authorize @survey  # Verifica se o usuário tem permissão para deletar
    @survey.destroy
    redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
  end

  private

  def authorize_coordinator
    unless current_user.coordinator?
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
