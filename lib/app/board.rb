class Board
    attr_accessor :available_spaces, :A1, :A2, :A3, :B1, :B2, :B3, :C1, :C2, :C3, :last_player

    def initialize
        @available_spaces = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
        @A1 = @A2 = @A3 = @B1 = @B2 = @B3 = @C1 = @C2 = @C3 = " "
    end

    def draw
        system("clear")
        puts "    1   2   3"
        puts "  -------------"
        puts "A | #{@A1} | #{@A2} | #{@A3} |"
        puts "  -------------"
        puts "B | #{@B1} | #{@B2} | #{@B3} |"
        puts "  -------------"
        puts "C | #{@C1} | #{@C2} | #{@C3} |"
        puts "  -------------"
    end

    def available?(space)
        available_spaces.include?(space)
    end

    def mark(space, player)
        available_spaces.delete(space)
        instance_variable_set("@#{space}", player.sign)
        @last_player = player
    end

    def check_win
        if @A1 == @A2 && @A2 == @A3 && @A1 != " "
            return true
        elsif @B1 == @B2 && @B2 == @B3 && @B1 != " "
            return true
        elsif @C1 == @C2 && @C2 == @C3 && @C1 != " "
            return true
        elsif @A1 == @B1 && @B1 == @C1 && @A1 != " "
            return true
        elsif @A2 == @B2 && @B2 == @C2 && @A2 != " "
            return true
        elsif @A3 == @B3 && @B3 == @C3 && @A3 != " "
            return true
        elsif @A1 == @B2 && @B2 == @C3 && @A1 != " "
            return true
        elsif @A3 == @B2 && @B2 == @C1 && @A3 != " "
            return true
        else
            return false
        end
    end

    def check_empty_spaces_left
        available_spaces.length > 0
    end
end