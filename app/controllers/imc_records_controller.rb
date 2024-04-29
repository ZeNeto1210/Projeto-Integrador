# frozen_string_literal: true

# Controller responsável por calcular e exibir os registros de IMC.
class ImcRecordsController < ApplicationController
  skip_before_action :verify_authenticity_token # Para APIs, desabilita a verificação de autenticidade

  def index
    # Renderiza a view index.html.erb que contém o formulário para inserir peso e altura
    render 'index'
  end

  def calculate
    puts 'Método calculate foi chamado' # Adiciona um puts para verificar se o método é chamado
    weight = params[:weight].to_f
    height = params[:height].to_f
    unless valid_values?(weight, height)
      flash[:alert] = 'Peso e altura devem ser valores positivos.'
      redirect_to root_path
      return
    end
    @bmi = calculate_bmi(weight, height)
    @category = evaluate_bmi_category(@bmi)
    render 'index'
  end

  private

  def valid_values?(weight, height)
    weight.positive? && height.positive?
  end

  def calculate_bmi(weight, height)
    weight / (height * height)
  end

  def evaluate_bmi_category(bmi)
    case bmi
    when ->(b) { b < 18.5 }
      'Abaixo do peso'
    when 18.5..24.9
      'Peso normal'
    when 25..29.9
      'Sobrepeso'
    else
      'Obeso'
    end
  end
end
