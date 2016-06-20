class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def send_csv(data)
    puts data
    send_data Exporter.new(data).call, filename: "#{data.model_name.human}.csv", content_type: 'text/csv; encoding: windows-1251'
  end
end
