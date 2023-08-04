module ValidatorsAndErrorHandlers
  module Validators
    module ParamValidator

      def evaluate_params
        number = get_integer_or_error(params[:num])
        
        if number.is_a?(Integer)
          number  = number > 10 ?  10 : number
          number
        else
          error_hash([number])
        end
      end

      def convert_valid_param_to_integers
        wins = set_value(params[:wins])
        rounds = set_value(params[:rounds])

        if wins.is_a?(ArgumentError) || rounds.is_a?(ArgumentError)
          errors = Array.new
          errors.push(wins) unless wins.is_a?(Integer)
          errors.push(rounds) unless rounds.is_a?(Integer)
        elsif (rounds > 10)
          return error_hash(["Rounds (#{rounds}) must not exceed 10"])
        end
        
        unless errors.present?
          evaluate_wins_to_rounds(wins, rounds) 
        else
          error_hash(errors)
        end
      end

      def set_value(param)
        if param.nil? 
          param = 5
        else 
          param = get_integer_or_error(param)
        end
        param
      end

      def get_integer_or_error(param)
        begin
          Integer(param)
        rescue ArgumentError => error
          error
        end
      end

      def evaluate_wins_to_rounds(wins, rounds)
        if wins > rounds
          error_hash(["Wins (#{wins}) must be less than or equal to Rounds (#{rounds})"])
        else
          { score: [wins, rounds] }
        end        
      end
    end 
  end
end