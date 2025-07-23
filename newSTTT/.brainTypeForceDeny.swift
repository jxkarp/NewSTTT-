//
//  brainTypeForceDeny documentation
//  SuperTicTacToe
//
//  250707 Created by Jack Karp
//

/*
 
 Deny opponent the same grid as you (the same grid you just played?)
 
    g   6       grid just played

    repeat
        proposeRandomGrid
    while tempI1 = g
    convertGridToRC(grd22: tempI1) // this forces play to a different grid
 
 Force opponent to concentrate TTTs in bad grids
 
 idk what i meant by this
 
    force           not
            1       11
    212     2       12
    221     3       13
    223     4       14
    232     5       22
    412     6       23
    421     7       31
    423     8       32
    432     9       33
 
 */
