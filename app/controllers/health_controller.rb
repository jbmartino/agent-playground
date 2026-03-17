class HealthController < ActionController::Base
  def show
    checks = {
      status: "ok",
      database: database_connected?
    }

    status = checks[:database] ? :ok : :service_unavailable

    render json: checks, status: status
  end

  private

  def database_connected?
    ActiveRecord::Base.connection.execute("SELECT 1")
    true
  rescue StandardError
    false
  end
end
