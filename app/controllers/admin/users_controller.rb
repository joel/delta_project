# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    # GET /admin/users or /admin/users.json
    def index
      @users = User.all
    end
  end
end
