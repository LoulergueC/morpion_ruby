require 'bundler'
Bundler.require

require_relative 'lib/app/board'
require_relative 'lib/app/game'
require_relative 'lib/app/player'

puts "
Bienvenue sur le jeu du Morpion !

Les règles sont simples : vous devez aligner 3 symboles sur une ligne, colonne ou diagonale.
A tour de rôle, vous choisissez où vous voulez placer votre symbole comme suit :
----------------
| A1 | A2 | A3 |
----------------   Par ex. pour placer 
| B1 | B2 | B3 |   en haut à gauche,
----------------   Il faudra saisir A1.
| C1 | C2 | C3 |
----------------

Maintenant, annoncez votre nom et votre symbole :"
        print "Nom du premier joueur : "
        player1_name = gets.chomp
        print "Symbole du premier joueur : "
        player1_sign = gets.chomp
        puts ""
        print "Nom du deuxième joueur : "
        player2_name = gets.chomp
        print "Symbole du deuxième joueur : "
        player2_sign = gets.chomp

        
        player1 = Player.new(player1_name, player1_sign)
        player2 = Player.new(player2_name, player2_sign)

while 1 == 1
    game = Game.new()
    while !game.is_over?
        game.play(player1)
        break if game.is_over?
        game.play(player2)
    end

    game.show_result
    game.show_score(player1, player2)

    puts ""
    print "Nouvelle partie ? (y/n) "
    new_game = gets.chomp
    break if new_game != "y" && new_game != "Y"
end

puts ""
puts "Merci d'avoir joué !"
puts "Voici les scores finaux :"
game.show_score(player1, player2)
