class ComputerPlayer
    def initialize
        @known_cards = Hash.new {|h, k| h[k] = []}
        @matched_cards = Hash.new { |h, k| h[k] = []}
        @current_pair = nil
        @matched_keys = []
    end

    def recieve_revealed_card(key, value)
        if !@known_cards[key].include?(value)
            @known_cards[key] << value
        end
        @known_cards.each_key do |key|
            if @known_cards[key].length == 2
                print @known_cards[key]
                recieve_match(key, @known_cards[key][0], @known_cards[key][1])
            end
        end
    end

    def recieve_match(key, pos1, pos2)
        @matched_cards[key] << pos1
        @matched_cards[key] << pos2
    end

    def get_position(previous_guess)
        if previous_guess == nil
            if @matched_cards.length > @matched_keys.length
                puts "case 1: matched cards detected"
                match = @matched_cards.keys
                i = 0
                puts 'Entering while loop'
                while @matched_keys.include?(match[i]) && i < match.length
                    i += 1
                end
                puts 'Exited while loop'
                @current_pair = match[i]
                #puts @matched_cards[@current_pair][0]
                return @matched_cards[@current_pair][0]
            else
                puts "case 2: first guess no matched cards detected"
                return self.get_new_position
            end
        else
            if @current_pair != nil
                puts "case 3: guessing second matched card"
                #puts @matched_cards[@cu]
                @matched_keys << @current_pair
                temp = @matched_cards[@current_pair][1]
                @current_pair = nil
                return temp
            else
                puts "case 4: second random guess"
                return self.get_new_position
            end
        end
    end

    def get_new_position
        row = rand(0...4)
        col = rand(0...4)
        valid = false

        while !valid
            valid = true
            @known_cards.each_key do |key|
                @known_cards[key].each do |pos|
                    if pos == [row, col]
                        valid = false
                        row = rand(0...4)
                        col = rand(0...4)
                    end
                end
            end
            
        end
        return [row, col]
    end
end