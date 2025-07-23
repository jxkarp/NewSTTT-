//
//  ..STTT documentation
//  SuperTicTacToe
//
//  Created by Jack Karp on 6/26/25.
//
/*
 
 Super TTT

 https://www.youtube.com/shorts/_Na3a1ZrX7c
 
 
 Super Tic Tac Toe

 There are 10 grids (9 small grids and one big grid) and they are all scored for tic tac toe (TTT) by the same algorithm.

 If a small grid has an X or O in a space, that space is not open
 If the big grid has an X or O in it, that grid is not open

 There are two Methods of moving:
     • A) The player chooses any open grid on the big grid and any open space in the small grid
     • B) The game determines the big grid and the player chooses any open space in that small grid

 The players can be two humans or human and board.
 A method is determined to select which player will go first

 Game Play

     • To start the game, Player 1 uses method A to make the first move and that square of the small grid is marked with an X or O
     • Repeat
         - The small grid selected by the previous player is checked for TTT. If the move has resulted in a TTT, that square of the big grid is marked with an X or O
         - The big grid is checked for TTT. If there is a TTT on the big grid, the game is over
         - If the previous move has resulted in a TTT, Player 2 uses method A to make the next move, otherwise Method B is used.

    
 */
