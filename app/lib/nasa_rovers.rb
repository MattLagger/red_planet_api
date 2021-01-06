class NasaRovers
  def initialize(connection = Faraday.new)
    @connection = connection
  end

  def all_rovers 
    url = "#{ENV['NASA_API_URL']}/rovers"

    resp = @connection.get url, {
      api_key: ENV['NASA_API_KEY']
    }

    resp.body
  end

  def manifests(rover)
    url = "#{ENV['NASA_API_URL']}/manifests/#{rover}"

    resp = @connection.get url, {
      api_key: ENV['NASA_API_KEY']
    }

    resp.body
  end

  def photos(params)
    url = "#{ENV['NASA_API_URL']}/rovers/#{params[:rover]}/photos"
    
    resp = @connection.get url, {
      api_key: ENV['NASA_API_KEY'],
      earth_date: params[:earth_date],
      page: params[:page] || 1
    }

    resp.body
  end
end
