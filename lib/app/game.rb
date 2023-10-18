class Game
    attr_accessor :board

    def initialize
        @board = Board.new
    end

    def play(player)
        @board.draw
        @board.mark(choose_space(player.name), player)
    end

    def choose_space(player_name)
        puts "Hey #{player_name}, c'est à ton tour !"
        puts ""
        puts "Fais ton choix :"
        print "> "
        choice = gets.chomp
        while !@board.available?(choice) do
            puts ""
            puts "Choix non valide"
            print "> "
            choice = gets.chomp
        end
        return choice
    end

    def is_over?
        if @board.check_win || !@board.check_empty_spaces_left
            return true
        else
            return false
        end
    end

    def show_score(player1, player2)
        puts ""
        puts "Score : #{player1.name} : #{player1.score} / #{player2.name} : #{player2.score}"
    end

    def show_result
        if @board.check_win
            @board.draw
            puts ""
            puts "🎉 Félicitations à #{@board.last_player.name} ! 🥳"
            puts ""
            @board.last_player.add_point
        else
            @board.draw
            puts "Malheureusement, c'est un match nul !"
        end
    end
    
end