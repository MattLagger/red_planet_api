class NasaRovers
  def initialize(connection = Faraday.new)
    @connection = connection
  end

  def all 
    url = "#{ENV['NASA_API_URL']}/rovers"

    resp = @connection.get url, {
      api_key: ENV['NASA_API_KEY']
    }

    resp.body
  end
end
