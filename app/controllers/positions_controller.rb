class PositionsController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :set_topics, :except => [:index]

    def index

    end

end
