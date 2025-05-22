class CalculatorController < ApplicationController
    def add
        input = params[:numbers] || ""
        result = StringCalculator.add(input)
        render json: { result: result }
      rescue => e
        render json: { error: e.message }, status: 400
    end
end
