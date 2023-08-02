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
        wins = get_integer_or_error(params[:wins]) unless params[:wins].nil? 
        rounds = get_integer_or_error(params[:rounds]) unless params[:rounds].nil? 
        
        if wins.is_a?(ArgumentError) || rounds.is_a?(ArgumentError)
          errors = Array.new
          errors.push(wins) unless wins.is_a?(Integer)
          errors.push(rounds) unless rounds.is_a?(Integer)
        else
          wins = 0 if wins.nil? 
          rounds = 5 if rounds.nil?
        end
        
        unless errors.present?
          evaluate_wins_to_rounds(wins, rounds) 
        else
          error_hash(errors)
        end
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
          return  error_hash(["Wins must be less than or equal to Rounds"])
        else
          return { score: [wins, rounds] }
        end        
      end

    end 
  end
end