//
//  ..braintypeMiddle documentation
//  SuperTicTacToe
//
//  Created by Jack Karp on 6/26/25.
//
/*
 
 Super TTT
 
 • The strategy is based on how many tokens have been played on the board
 
 • NO NO NO: This true only if players strictly alternate moves in a given grid
    - If the board has 0, 2. 4. 6, or 8 tokens, it is the first player's move
    - If the board has 1, 3, 5, or 7 tokens, it is the second player's move
    - IT BECOMES RELEVANT WHEN count > 2

 • So far, the strategy is detailed when there are 0, 1, or 2 tokens on the board

 • A general strategy is pursued when there are 3 or more tokens on the board

 • An opportunity is two of the player's tokens in any row, column, or diagonal

 • A threat is two of the opponent's tokens in any row, column or diagonal
 
 • Count:
    - here, is the count of all the tokens on the board
    - need count of token and oppToken with strategy to follow

 Count   Strategy

 0       Play [2,2]
 1       If [2,2] is available, take it; otherwise take any available corner
 2       If all corners are free, take one; otherwise take a corner thats adjacent to the corner that's taken
 3       a) if TTT in the grid, get new grid from grid 0 ??? <== hmm, leave this out for now
         b) check for and take the first opportunity
         c) check for and block the first threat
         d) take the middle
 
 
 
 // if opportunity 1 {
 //     move 1
 // } else if opportunity 2 {
 //     move 2
 // } else if other opportunities {
 //     other moves
 // } else if threat 1 {
 //     move 1
 // } else if threat 2 {
 //     move 2
 // } else if other threats {
 //     other moves
 // } else if middle is free {
 //     take middle
 // } else
 //     boy do we have a problem
 // }
 
 

 */
