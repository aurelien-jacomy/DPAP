class FabricsController < ApplicationController

    def index
        @fabrics = policy_scope(Fabric) 
    end
end
