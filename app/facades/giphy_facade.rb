class GiphyFacade
  def self.mean_or_nice(phrase)
    response = GiphyService.gif_search(phrase)

    response[:data].find do |gif|  
    #hierarchy: select based on ratings 'r'or 'pg' when available
      if gif[:rating] == "r"
        return selected_data_from_response(gif) 
      elsif
        gif[:rating] == "pg"
        return selected_data_from_response(gif) 
      else
        return selected_data_from_response(gif) 
      end        
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