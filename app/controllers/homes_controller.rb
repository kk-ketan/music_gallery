class HomesController < ApplicationController
    def index
        @homes=Music.all.where(published: true)
        @ketan=@homes.ransack(params[:ketan])
        @homes=@ketan.result(distinct: true)
    end
end
