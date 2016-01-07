class CapsController < ApplicationController
    before_action :set_cap, only: [:show, :edit, :update, :destroy]
    before_action :authorize, except: [:show, :index]
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

        def authorize
            if current_user.nil?
                redirect_to login_url, notice:
                    "Não autorizado, por favor faça login"
            else
                if @cap && @cap.user != current_user
                    redirect_to root_path, notice: "Usuário não autorizado!"
                end
            end
        end
end
