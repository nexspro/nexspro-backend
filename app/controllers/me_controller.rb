class MeController < ApplicationController
  before_action { rodauth.require_authentication }

  def show
    rodauth = request.env["rodauth"]

    render json: {
      jwt_session_value: rodauth.session_value,
      account: rodauth.account
    }
  end
end
