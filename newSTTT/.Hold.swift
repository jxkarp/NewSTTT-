//
//  .Hold.swift
//  newSTTT
//
//  Created by Jack Karp on 7/18/25.
//

/*
 
 func proposeAdjacentCorner(grd20: Int) {
     if isSquareTaken(grd10: grd20, row10: 1, col10: 1) || isSquareTaken(grd10: grd20, row10: 3, col10: 3) {
         // else if a corner is taken, take an adjacent corner
         if isSquareTaken(grd10: grd20, row10: 1, col10: 3) {
             tempRC = [1, 3]
             // proposeFlag = true
         } else if isSquareTaken(grd10: grd20, row10: 3, col10: 1) {
             tempRC = [1, 3]
             // proposeFlag = true
         } // end if
     } else if isSquareTaken(grd10: grd20, row10: 1, col10: 3) || isSquareTaken(grd10: grd20, row10: 3, col10: 1) {
         // else if a corner is taken, take an adjacent corner
         if isSquareTaken(grd10: grd20, row10: 3, col10: 3) {
             tempRC = [1, 1]
             // proposeFlag = true
         } else if isSquareTaken(grd10: grd20, row10: 1, col10: 1) {
             tempRC = [3, 3]
             // proposeFlag = true
         } // end if
     } // end if
     // proposeTempG(grd21: grd20)
 } // end func proposeAdjacentCorner(grd20: Int)

 
 func proposeCorner(grd20: Int, row18: Int, col18: Int) {
     if !isSquareTaken(grd10: grd20, row10: row18, col10: col18) {
         tempRC = [row18, col18]
         // proposeFlag = true
     } // end if
     
     // proposeTempG(grd21: grd20)
 } // end func proposeCorner
 

 
 func proposeFreeMiddle(grd20: Int) {
     if !isSquareTaken(grd10: grd20, row10: 2, col10: 2) {
         tempRC = [2, 2]
         // proposeFlag = true
     } // end if middle is free
     
     // proposeTempG(grd21: grd20)
 } // end func proposeFreeMiddle

 
 func proposeTempG(grd21: Int) {
     // should be called from within another propose function
     
     if grd21 == 0 {
         tempG = tempRC[0] * 3 + tempRC[1]
     } // end if
 } // end func proposeTempG
 

 

 func proposeOorT(grd12: Int, tok12: String...) {
     //  Opportunity = called with token
     //  Threat = called with oppToken
     // called with both playerCurrent.oppToken and playerCurrent.token checks first for threats, then for opportunities in one call
     // // returns proposeFlag
     for x in tok12 {
         if game[pos(pt1: [grd12, 1, 1])] == x && game[pos(pt1: [grd12, 1, 2])] == x && game[pos(pt1: [grd12, 1, 3])] == under {
             // row 1
             // 11, 12, -> 13
             tempRC = [1, 3]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 1])] == x && game[pos(pt1: [grd12, 1, 3])] == x && game[pos(pt1: [grd12, 1, 2])] == under {
             // row 1
             // 11, 13 -> 12
             tempRC = [1, 2]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 2])] == x && game[pos(pt1: [grd12, 1, 3])] == x && game[pos(pt1: [grd12, 1, 1])] == under {
             // row 1
             // 12, 13 -> 11
             tempRC = [1, 1]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 2, 1])] == x && game[pos(pt1: [grd12, 2, 2])] == x && game[pos(pt1: [grd12, 2, 3])] == under {
             // row 2
             // 21, 22, -> 23
             tempRC = [2, 3]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 2, 1])] == x && game[pos(pt1: [grd12, 2, 3])] == x && game[pos(pt1: [grd12, 2, 2])] == under {
             // row 2
             // 21, 23 -> 22
             tempRC = [2, 2]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 2, 2])] == x && game[pos(pt1: [grd12, 2, 3])] == x && game[pos(pt1: [grd12, 2, 1])] == under {
             // row 2
             // 22, 23 -> 21
             tempRC = [2, 1]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 3, 1])] == x && game[pos(pt1: [grd12, 3, 2])] == x && game[pos(pt1: [grd12, 3, 3])] == under {
             // row 3
             // 31, 32, -> 33
             tempRC = [3, 3]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 3, 1])] == x && game[pos(pt1: [grd12, 3, 3])] == x && game[pos(pt1: [grd12, 3, 2])] == under {
             // row 3
             // 31, 33 -> 32
             tempRC = [3, 2]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 3, 2])] == x && game[pos(pt1: [grd12, 3, 3])] == x && game[pos(pt1: [grd12, 3, 1])] == under {
             // row 3
             // 32, 33 -> 31
             tempRC = [3, 1]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 1])] == x && game[pos(pt1: [grd12, 2, 1])] == x && game[pos(pt1: [grd12, 3, 1])] == under {
             // col 1
             // 11, 21 -> 31
             tempRC = [3, 1]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 1])] == x && game[pos(pt1: [grd12, 3, 1])] == x && game[pos(pt1: [grd12, 2, 1])] == under {
             // col 1
             // 11, 31 -> 21
             tempRC = [2, 1]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 2, 1])] == x && game[pos(pt1: [grd12, 3, 1])] == x && game[pos(pt1: [grd12, 1, 1])] == under {
             // col 1
             // 21, 31 -> 11
             tempRC = [1, 1]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 2])] == x && game[pos(pt1: [grd12, 2, 2])] == x && game[pos(pt1: [grd12, 3, 2])] == under {
             // col 2
             // 12, 22 -> 32
             tempRC = [3, 2]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 2])] == x && game[pos(pt1: [grd12, 3, 2])] == x && game[pos(pt1: [grd12, 2, 2])] == under {
             // col 2
             // 12, 32 -> 22
             tempRC = [2, 2]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 2, 1])] == x && game[pos(pt1: [grd12, 3, 1])] == x && game[pos(pt1: [grd12, 1, 1])] == under {
             // col 2
             // 22, 32 -> 12
             tempRC = [1, 2]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 3])] == x && game[pos(pt1: [grd12, 2, 3])] == x && game[pos(pt1: [grd12, 3, 3])] == under {
             // col 3
             // 13, 23 -> 33
             tempRC = [3, 3]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 3])] == x && game[pos(pt1: [grd12, 3, 3])] == x && game[pos(pt1: [grd12, 2, 3])] == under {
             // col 3
             // 13, 33 -> 23
             tempRC = [2, 3]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 2, 3])] == x && game[pos(pt1: [grd12, 3, 3])] == x && game[pos(pt1: [grd12, 1, 3])] == under {
             // col 3
             // 23, 33 -> 13
             tempRC = [1, 3]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 1])] == x && game[pos(pt1: [grd12, 2, 2])] == x && game[pos(pt1: [grd12, 3, 3])] == under {
             // diag L to R
             // 11, 22 -> 33
             tempRC = [3, 3]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 1])] == x && game[pos(pt1: [grd12, 3, 3])] == x && game[pos(pt1: [grd12, 2, 2])] == under {
             // diag L to R
             // 11, 33 -> 22
             tempRC = [2, 2]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 2, 2])] == x && game[pos(pt1: [grd12, 3, 3])] == x && game[pos(pt1: [grd12, 1, 1])] == under {
             // diag L to R
             // 22, 33 -> 11
             tempRC = [1, 1]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 3])] == x && game[pos(pt1: [grd12, 2, 2])] == x && game[pos(pt1: [grd12, 3, 1])] == under {
             // diag R to L
             // 13, 22 -> 31
             tempRC = [3, 1]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 1, 3])] == x && game[pos(pt1: [grd12, 3, 1])] == x && game[pos(pt1: [grd12, 2, 2])] == under {
             // diag R to L
             // 13, 31 -> 22
             tempRC = [2, 2]
             // proposeFlag = true
         } else if game[pos(pt1: [grd12, 2, 2])] == x && game[pos(pt1: [grd12, 3, 1])] == x && game[pos(pt1: [grd12, 1, 3])] == under {
             // diag R to L
             // 22, 31 -> 13
             tempRC = [1, 3]
             // proposeFlag = true
         } // end if
     } // end for
     
     // proposeTempG(grd21: grd12)
 } // end func takeOorT

 
 
 
 
 
 
 */
