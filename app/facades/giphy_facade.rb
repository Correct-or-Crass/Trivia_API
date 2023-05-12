class GiphyFacade
  def self.mean_or_nice(phrase, rating)
    response = GiphyService.gif_search(phrase,rating)

    if response[:data].count > 0        
      giphy_response = response[:data].find do |gif|  
        return selected_data_from_response(gif) if gif[:rating] == 'r'
        return selected_data_from_response(gif) if gif[:rating] == 'pg' || gif[:rating] == 'g'
      end              
    else
      #plan to insert game logo
    end
  end

  def self.selected_data_from_response(data)
    gif_data = []
      gif_data << {
      url:    data[:url].to_json,
      title:  data[:title].to_json,
      rating: data[:rating].to_json
      }
  end

end