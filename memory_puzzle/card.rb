class Card
    def initialize(face_value)
        @face_value = face_value
        @face = "down"
    end

    attr_reader :face_value, :face

    def display
        if @face == "up"
            return @face_value
        else
            return " "
        end
    end

    def hide
        @face = "down"
    end

    def reveal
        @face = "up"
    end

    def to_s
        return @face_value
    end

    def ==(other_card)
        if other_card == nil
            return false
        else
            @face_value == other_card.face_value
        end
    end

end
