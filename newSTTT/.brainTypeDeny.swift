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
 
 This code just prevents going in the same grid as the opponent just played. It does not prevent the opponent from returning to that grid.
 tempG = g
 repeat {
     proposeRandomGrid()
 } while tempG == g // end while
 Also, {1,1] prevents return to 1; [1,2] prevents return to 2; etc.

 If deny(tempG, tempRC) squareIsTaken, then ...
 
    temp?? = convertGridToRC(grd22: tempG)
    repeat {
        proposeRandomRC
    } while tempRC == temp?? || !squareIsTaken(tempG, tempR, tempC)
 
    Other considerations
        • if squareIsTaken(tempG, tempR, tempC), can pick a (non-deny square in same grid, or a (deny) square in a different grid
        • if count(bigBoard, "-") >= 2 can proceed. If there is only 1 square free, then must take (non-deny) square in same grid
 
 
        badRC = convertGridtoRC(tempG) // this is the RC we do not want to play
        // dont have to check for count = 0 cause we would not be here
        if count(bigBoard, "_" = 1 {
            // there is only 1 free grid
            switch count(tempG, under) {
            // dont have to check for count = 0 cause we would not be here
            case 1:
                proposeRandomRC // OR FIND A NEW GRID
            default:
                repeat {
                    proposeRandomRC // checks for isSquareTaken
                } until tempRC != badRC // if there are 2 or more free squares at least one of them is not badRC
            } // end switch count
        } else { // count(bigBoard, under) >= 2
            // there are 2 or more free grids
            // ==> try isSquareTaken in free grid; if available, propose it, else proposeRandomRC
 
        }
 
            switch()  {

 
    So:
        if count(tempG, "_" < 2
            proposeRandomSquare()
        else if (deny) isSquareTaken
            get new grid
            try new (deny) square
        else
            tempRC = (deny) square
 
 
 -or- -or- -or-
 
        // forget tempG
        for grid = 1 ... 9
            if !TTT && !Draw
                repeat {
                    proposeRandomRC // checks for isSquareTaken
                } until tempRC != badRC // if there are 2 or more free squares at least one of them is not badRC

                
 */
