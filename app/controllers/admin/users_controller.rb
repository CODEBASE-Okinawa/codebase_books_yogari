class Admin::UsersController < ApplicationController
    before_action :check_admin

    def index
        @users = User.where.not(role: 0)
    end
end
