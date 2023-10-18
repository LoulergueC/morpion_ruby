class Player
    attr_accessor :name, :score, :sign
    def initialize(name, sign)
        @name = name
        @score = 0
        @sign = sign
    end

    def add_point
        @score += 1
    end
end