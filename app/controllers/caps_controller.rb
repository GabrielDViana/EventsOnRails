class CapsController < ApplicationController
    before_action :set_cap, only: [:show, :edit, :update, :destroy]

    def index
        @caps = Cap.all
    end

    def new
        @cap = Cap.new
    end

    def create
        @cap = current_user.caps.build(cap_params)

        if @cap.save
            redirect_to @cap, notice: 'Cap criado!'
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def destroy
        @cap.destroy
        redirect_to cap_url, notice: 'Cap deletado!'
    end

    private
        def set_cap
            @cap = Cap.find(params[:id])
        end

        def cap_params
            params.require(:cap).permit(:title, :area, :date, :time)
        end
end
