class HomesController < ApplicationController
    def index
        @homes=Music.all.where(published: true)
        @q=@homes.ransack(params[:q])
        @homes=@q.result(distinct: true)
    end
end
