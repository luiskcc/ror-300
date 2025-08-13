class QuestionsController < ApplicationController
    # Create a CRUD for questions with before_Action and private methods
    before_Action :set_question, only: [:show, :edit, :update, :destroy]

    def index
        @questions = Question.all
    end

    def show
        @question = Question.set_question
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        if @question.save
            redirect_to @question, notice: "Question was succesfully created"
        else
            render :new
        end
    end

    def edit
        @question = Question.set_question
    end

    private

    def set_question
        @question = Question.find(params[:id])
    end

    def question_params
        params.require(:answer).permit(:content, :question_id)
    end
end
