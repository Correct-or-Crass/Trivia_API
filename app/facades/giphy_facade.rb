class GiphyFacade
  def self.mean_or_nice(phrase)
    response = GiphyService.gif_search(phrase)

    r_rated   = Array.new
    pg_rated  = Array.new 
    g_rated   = Array.new

    response[:data].each do |gif|
      r_rated << hash_of_url_title_rating(gif) if gif[:rating] == "r"
      pg_rated << hash_of_url_title_rating(gif) if gif[:rating] == "pg" || gif[:rating] == "pg-13"
      g_rated << hash_of_url_title_rating(gif) if gif[:rating] == "g"
    end

    if r_rated.present?
      return r_rated.sample
    elsif pg_rated.present?
      return pg_rated.sample
    elsif g_rated.present?
      return g_rated.sample
    end
  end

  def self.hash_of_url_title_rating(data)
    gif_data = []
      gif_data << {
      url:    data[:url].to_json,
      title:  data[:title].to_json,
      rating: data[:rating].to_json
      }
  end

    def word_length_filter(string)
      split_s = string.split(' ')

      phrase_arr = []

      split_s.select do |word| 
          if phrase_arr.join(' ').length < 40

              if word.length > 3
                  phrase_arr << word
              end
          end
      end

      phrase_arr.join(' ')
    end
end