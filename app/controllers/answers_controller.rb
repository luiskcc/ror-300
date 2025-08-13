class AnswersController < ApplicationController
    before_action :set_answer, only: [:show, :edit, :update, :destroy]

    def index
        @answers = Answer.all
    end

    def show
        @answer = Answer.set_answer
    end

    def new
        @answer = Answer.new
    end

    def create
        @answer = Answer.new(answer_params)
    end
    
    def destroy
        if @answer = Answer.set_answer
            @answer.destroy
            redirect_to answers_path, notice: "Answer was succesfully deleted"
        else
            redirect_to answers_path, alert: "Answer not found"
        end
    end

    private

    def set_answer
        @answer = Answer.find(params[:id])
    end

    def answer_params
        params.require(:answer).permit(:content, :question_id)
    end
end
