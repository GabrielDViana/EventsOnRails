class CapsController < ApplicationController
    before_action :set_cap, only: [:show, :edit, :update, :destroy]
    before_action :authorize, except: [:show, :index]

    def index
        if params[:tag]
            @caps = Cap.tagged_with(params[:tag])
        else
            @caps = Cap.all
        end
        @caps_by_date = @caps.group_by(&:start_at)
        @date = params[:date] ? Date.parse(params[:date]) : Date.today
    end

    def new
        @cap = Cap.new
    end

    def create
        @cap = current_user.caps.build(cap_params)
        @cap.user_id = current_user.id
        if @cap.save
            redirect_to @cap
            flash[:success] = 'Cap criado!'
        else
            render :new
        end
    end

    def show
      @users = @cap.users
    end

    def edit
    end

    def destroy
        @cap.destroy
        redirect_to caps_path
        flash[:success] = 'Cap deletado!'
    end

    private
        def set_cap
            @cap = Cap.find(params[:id])
        end

        def cap_params
            params.require(:cap).permit(:title, :area, :date, :time, :address,
                :latitude, :longitude, :tag_list, :city, :state, :country,
                :cap_image, :start_at, :end_at, :time_start, :time_end,
                :meetings, :observations)
        end

        def authorize
            if current_user.nil?
                redirect_to login_url
                flash[:error] = "Não autorizado, por favor faça login"
            else
                if @cap && @cap.user != current_user
                    redirect_to root_path,
                    flash[:error] = "Usuário não autorizado!"
                end
            end
        end
end
