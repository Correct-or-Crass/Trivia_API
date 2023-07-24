module ParamValidator


  def convert_valid_param_to_integer#(param)
    begin 
      Integer(params[:wins]) ||  Integer(params[:wins])
      wins   = params[:wins].to_i || 0
      rounds = params[:rounds].to_i || 5
      more_rounds_than_wins?([wins, rounds])
    rescue => exception
      nil
    end
  end

  #wins <= round
  def more_rounds_than_wins?(integer_array)
    if integer_array[0] <= integer_array[-1]
      return integer_array
    else
      return "error"
    end
    # require 'pry';binding.pry
  end

  # wins >= 0 && rounds >= 1

  # rounds <= 10

  # 

end