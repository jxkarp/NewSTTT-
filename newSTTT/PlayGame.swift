//
//  PlayGame.swift
//  newSTTT
//
//  Created by Jack Karp on 7/9/25.
//

// P L A Y G A M E   S T R U C T
struct PlayGame {
    // P L A Y G A M E C O N S T A N T S
    let under = "_"
    let sp6 = "      "
    let sp7 = "       "
    let bigBoard = 0 // index to the Big Board grid in game
    // Small grids are indexed by their number: 1...9 var grd

    // the array of all 8 TTT Arrays <== probably best
    let tttAs = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    let pMsg = [
        "*", // 0 because 0
        "Press return to continue, or Q to quit: ", // 1 Press return
        icnExclam + "What grid would you like to play?", // 2 What grid
        icnQMark + "Please enter a number from 1 to 9: ", // 3 enter 1..9
        icnExclam + "What row would you like to play?", // 4 What row?
        icnQMark + "Please enter a number from 1 to 3: ", // 5 Enter 1...3
        icnExclam + "What column would you like to play?", // 6 What column
        icnError + "That square is already taken!", // 7 Square is taken
        sp2 + "Please try again.", // 8 try again
        " has Tic Tac Toe in Grid ", // 9 Player has TTT in Grid
        icnHand + icnHand + "Congratulations, ", // 10 Congratulations
        " you won Super Tic Tac Toe! " + icnHand + icnHand, // 11 you won STTT
        icnInfo + "Grid ", // 12 Grid
        " is a draw.", // 13 draw
        icnHand + "Super Tic Tac Toe has ended in a draw!", // 14 end in draw
        ", you must play Grid ", // 15 you must play Grid
        " selected Grid ", // 16 selected Grid
        icnExclam+"Do you want to play again?", // 17 Play again
    ] // end var pMsg

    // P L A Y G A M E   V A R I A B L E S

    // the super matrix (grid = 0) and the nine visible grids (1-9)
    var game = ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_"]

    // Don't touch this!!! Make a copy!!!
    // var game = [ "_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_" ] // for reference

    var g = 0 // the grid
    var r = 0 // the row
    var c = 0 // the column
    var rc = [1, 1] // the row, col
    var pt = [1, 1, 1] // the point
    var tempG = 0
    var tempR = 0
    var tempC = 0
    var tempRC = [1, 1]
    var tempB = false // ??? now that error tuple is removed

    // P L A Y G A M E   F U N C T I O N S
    mutating func continuePlay() -> Bool {
        func pos(pt1: [Int]) -> Int { // pos returns the index to the array game
            return pt1[0] * 9 + (pt1[1] - 1) * 3 + pt1[2] - 1
        } // end func pos(pt1: [Int]) -> Int
        
        func hasTTTinGrid(grd3: Int, tok3: String...) -> Int {
            // if return == 0 there is no TTT, else the number that corresponds to which TTT (eg: row1, col3, LtoR diag, etc.)
            
            for w in tok3 {
                if game[pos(pt1: [grd3, 1, 1])] == w && game[pos(pt1: [grd3, 1, 2])] == w && game[pos(pt1: [grd3, 1, 3])] == w { // TTT in row 1
                    tempI1 = 1
                } else if game[pos(pt1: [grd3, 2, 1])] == w && game[pos(pt1: [grd3, 2, 2])] == w && game[pos(pt1: [grd3, 2, 3])] == w { // TTT in row 2
                    tempI1 = 2
                } else if game[pos(pt1: [grd3, 3, 1])] == w && game[pos(pt1: [grd3, 3, 2])] == w && game[pos(pt1: [grd3, 3, 3])] == w { // TTT in row 3
                    tempI1 = 3
                } else if game[pos(pt1: [grd3, 1, 1])] == w && game[pos(pt1: [grd3, 2, 1])] == w && game[pos(pt1: [grd3, 3, 1])] == w { // TTT in col 1
                    tempI1 = 4
                } else if game[pos(pt1: [grd3, 1, 2])] == w && game[pos(pt1: [grd3, 2, 2])] == w && game[pos(pt1: [grd3, 3, 2])] == w { // TTT in col 2
                    tempI1 = 5
                } else if game[pos(pt1: [grd3, 1, 3])] == w && game[pos(pt1: [grd3, 2, 3])] == w && game[pos(pt1: [grd3, 3, 3])] == w { // TTT in col 3
                    tempI1 = 6
                } else if game[pos(pt1: [grd3, 1, 1])] == w && game[pos(pt1: [grd3, 2, 2])] == w && game[pos(pt1: [grd3, 3, 3])] == w { // TTT in LR diagonal
                    tempI1 = 7
                } else if game[pos(pt1: [grd3, 1, 3])] == w && game[pos(pt1: [grd3, 2, 2])] == w && game[pos(pt1: [grd3, 3, 1])] == w { // TTT in RL diagonal
                    tempI1 = 8
                } else { // no TTT in this grid
                    tempI1 = 0
                } // end if
            } // end w
            return tempI1
        } // end func hasTTTinGrid(grd3: Int, tok3: String...) -> Int
        
        func count(grd8: Int, tok8: String...) -> Int { // counts tokens in the grid
            var c = 0
            for j in tok8 {
                for i in 0 ... 8 { // for each cell in the grid
                    if game[grd8 * 9 + i] == j {
                        c += 1
                    } // end if
                } // end for i
            } // end for j
            return c
        } // end func count
        
        func isGridDraw(grd15: Int) -> Bool {
            if count(grd8: grd15, tok8: ex, oh) == 9 {
                return true // draw
            } else { // no TTT and count = 9
                return false // no draw
            } // end if
        } // end func isGridDraw(grd15) -> Bool
        
        func displayBigBoard() {
            print("""
                    \n\t\t\(sp7)\(game[pos(pt1: [0, 1, 1])])\(sp2)\(game[pos(pt1: [0, 1, 2])])\(sp2)\(game[pos(pt1: [0, 1, 3])])\n\t\t\(sp7)\(game[pos(pt1: [0, 2, 1])])\(sp2)\(game[pos(pt1: [0, 2, 2])])\(sp2)\(game[pos(pt1: [0, 2, 3])])\n\t\t\(sp7)\(game[pos(pt1: [0, 3, 1])])\(sp2)\(game[pos(pt1: [0, 3, 2])])\(sp2)\(game[pos(pt1: [0, 3, 3])])
            """) // end print
        } // end func printBigBoard
        
        func displayGame(tag: Bool) {
            // C O N S T A N T S
            let horiz = "————————————————————————————-——————"
            let bar = "|"
            let sp3 = "   "
            let sp4 = "    "
            let sp10 = "          "
            let sp11 = "           "
            
            // F U N C T I O N S
            
            func formLabelLine(grd14: Int) -> String {
                func printGridLabel(grd6: Int) -> String {
                    if (hasTTTinGrid(grd3: grd6, tok3: ex, oh) != 0) || isGridDraw(grd15: grd6) {
                        return sp7
                    } else { // is big grid TTT
                        return "Grid" + sp1 + String(grd6) + sp1
                    } // end if
                } // end func printGridLabel
                
                // F O R M L A B E L L I N E   C O D E   H E R E
                if hasTTTinGrid(grd3: bigBoard, tok3: ex, oh) != 0 {
                    return ""
                } else {
                    return "\(tab2)\(sp6)\(printGridLabel(grd6: grd14))\(sp1)\(bar)\(sp3)\(printGridLabel(grd6: grd14 + 1))\(sp1)\(bar)\(sp3)\(printGridLabel(grd6: grd14 + 2))\n"
                } // end if
            } // end func formLabelLine
            
            func printSpacers() -> String {
                if hasTTTinGrid(grd3: bigBoard, tok3: ex, oh) != 0 || isGridDraw(grd15: bigBoard) {
                    return ""
                } else {
                    return "\(sp10)\(bar)\(sp11)\(bar)"
                } // end if
            } // end func printSpacers
            
            // D I S P L A Y G A M E   C O D E   H E R E
            if testBigBoard {
                displayBigBoard()
            } // end if
            // newLine()
            display(msg: """
                \n\(sp11)\(sp1)\(printSpacers())\n\(formLabelLine(grd14: 1))\(sp11)\(sp2)\(game[pos(pt1: [1, 1, 1])])\(sp2)\(game[pos(pt1: [1, 1, 2])])\(sp2)\(game[pos(pt1: [1, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [2, 1, 1])])\(sp2)\(game[pos(pt1: [2, 1, 2])])\(sp2)\(game[pos(pt1: [2, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [3, 1, 1])])\(sp2)\(game[pos(pt1: [3, 1, 2])])\(sp2)\(game[pos(pt1: [3, 1, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [1, 2, 1])])\(sp2)\(game[pos(pt1: [1, 2, 2])])\(sp2)\(game[pos(pt1: [1, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [2, 2, 1])])\(sp2)\(game[pos(pt1: [2, 2, 2])])\(sp2)\(game[pos(pt1: [2, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [3, 2, 1])])\(sp2)\(game[pos(pt1: [3, 2, 2])])\(sp2)\(game[pos(pt1: [3, 2, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [1, 3, 1])])\(sp2)\(game[pos(pt1: [1, 3, 2])])\(sp2)\(game[pos(pt1: [1, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [2, 3, 1])])\(sp2)\(game[pos(pt1: [2, 3, 2])])\(sp2)\(game[pos(pt1: [2, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [3, 3, 1])])\(sp2)\(game[pos(pt1: [3, 3, 2])])\(sp2)\(game[pos(pt1: [3, 3, 3])])\n\(tab2)\(sp4)\(horiz)\n\(formLabelLine(grd14: 4))\(sp11)\(sp2)\(game[pos(pt1: [4, 1, 1])])\(sp2)\(game[pos(pt1: [4, 1, 2])])\(sp2)\(game[pos(pt1: [4, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [5, 1, 1])])\(sp2)\(game[pos(pt1: [5, 1, 2])])\(sp2)\(game[pos(pt1: [5, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [6, 1, 1])])\(sp2)\(game[pos(pt1: [6, 1, 2])])\(sp2)\(game[pos(pt1: [6, 1, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [4, 2, 1])])\(sp2)\(game[pos(pt1: [4, 2, 2])])\(sp2)\(game[pos(pt1: [4, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [5, 2, 1])])\(sp2)\(game[pos(pt1: [5, 2, 2])])\(sp2)\(game[pos(pt1: [5, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [6, 2, 1])])\(sp2)\(game[pos(pt1: [6, 2, 2])])\(sp2)\(game[pos(pt1: [6, 2, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [4, 3, 1])])\(sp2)\(game[pos(pt1: [4, 3, 2])])\(sp2)\(game[pos(pt1: [4, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [5, 3, 1])])\(sp2)\(game[pos(pt1: [5, 3, 2])])\(sp2)\(game[pos(pt1: [5, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [6, 3, 1])])\(sp2)\(game[pos(pt1: [6, 3, 2])])\(sp2)\(game[pos(pt1: [6, 3, 3])])\n\(tab2)\(sp4)\(horiz)\n\(formLabelLine(grd14: 7))\(sp11)\(sp2)\(game[pos(pt1: [7, 1, 1])])\(sp2)\(game[pos(pt1: [7, 1, 2])])\(sp2)\(game[pos(pt1: [7, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [8, 1, 1])])\(sp2)\(game[pos(pt1: [8, 1, 2])])\(sp2)\(game[pos(pt1: [8, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [9, 1, 1])])\(sp2)\(game[pos(pt1: [9, 1, 2])])\(sp2)\(game[pos(pt1: [9, 1, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [7, 2, 1])])\(sp2)\(game[pos(pt1: [7, 2, 2])])\(sp2)\(game[pos(pt1: [7, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [8, 2, 1])])\(sp2)\(game[pos(pt1: [8, 2, 2])])\(sp2)\(game[pos(pt1: [8, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [9, 2, 1])])\(sp2)\(game[pos(pt1: [9, 2, 2])])\(sp2)\(game[pos(pt1: [9, 2, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [7, 3, 1])])\(sp2)\(game[pos(pt1: [7, 3, 2])])\(sp2)\(game[pos(pt1: [7, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [8, 3, 1])])\(sp2)\(game[pos(pt1: [8, 3, 2])])\(sp2)\(game[pos(pt1: [8, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [9, 3, 1])])\(sp2)\(game[pos(pt1: [9, 3, 2])])\(sp2)\(game[pos(pt1: [9, 3, 3])])\n\(sp11)\(sp1)\(printSpacers())
            """) // end display("""
            nL()
            display(msg: mMsg[7], trm: "")
            if !mmFlag || test { // pause for Return in either human game or test
                tempS1 = readLine(strippingNewline: true)!
            } else { // don't pause for return in MM game
                tempS1 = ""
            } // end if
            if test {
                // display(m2: testSpcM, msg: "Inside displayGame: continueFlag = \(continueFlag); tempS1 = \(tempS1)")
            } // end if test
        } // end func displayGame()
        
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
            
            proposeTempG(grd21: grd12)
        } // end func takeOorT
        
        func proposeTempG(grd21: Int) {
            // should be called from within another propose function
            
            if grd21 == 0 {
                tempG = tempRC[0] * 3 + tempRC[1]
            } // end if
        } // end func proposeTempG
        
        func isSquareTaken(grd10: Int, row10: Int, col10: Int) -> Bool {
            if game[pos(pt1: [grd10, row10, col10])] == under { // tests for under
                return false
            } else {
                return true
            } // end if
        } // end func isSquareTaken(grd10: Int, row10: Int, col10: Int) -> Bool
        
        func proposeRandomRC(grd20: Int) {
            repeat {
                tempRC = [Int.random(in: 1 ... 3), Int.random(in: 1 ... 3)]
            } while isSquareTaken(grd10: grd20, row10: tempR, col10: tempC)
            
            proposeTempG(grd21: grd20)
        } // end func takeRandomRC
        
        func proposeFreeMiddle(grd20: Int) {
            if !isSquareTaken(grd10: grd20, row10: 2, col10: 2) {
                tempRC = [2, 2]
                // proposeFlag = true
            } // end if middle is free
            
            proposeTempG(grd21: grd20)
        } // end func proposeFreeMiddle
        
        func proposeCorner(grd20: Int, row18: Int, col18: Int) {
            if !isSquareTaken(grd10: grd20, row10: row18, col10: col18) {
                tempRC = [row18, col18]
                // proposeFlag = true
            } // end if
            
            proposeTempG(grd21: grd20)
        } // end func proposeCorner
        
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
            proposeTempG(grd21: grd20)
        } // end func proposeAdjacentCorner(grd20: Int)
        
        func continueProposeRCorG() -> Bool {
            // returns continueFlag
            // must set rc = tempRC on return
            
            // C H O O S E P R O P O S E R C   C O D E   H E R E
            // returns (continueFlag, proposeFlag)
            // continueFlag: continue = true; quit = false
            // proposeFlag: tempRC is proposed = true; tempRC not proposed = false
            // must set rc = tempRC on return
            
            continueFlag = true
            // proposeFlag = false
            if test {
                display(m2: testM, msg: "Current player's strategy = \(playerCurrent.strategy)")
            } // end if
            switch playerCurrent.strategy {
            case .random:
                if test {
                    display(m2: testM, msg: "Random strategy")
                } // end if
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomRC(grd20: g)
                default:
                    proposeRandomRC(grd20: g)
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .middle:
                if test {
                    display(m2: testM, msg: "Middle strategy")
                } // end if
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0:
                    
                    proposeFreeMiddle(grd20: g)
                    
                case 1:
                    
                    proposeCorner(grd20: g, row18: 1, col18: 1)
                    proposeCorner(grd20: g, row18: 1, col18: 3)
                    proposeCorner(grd20: g, row18: 3, col18: 1)
                    proposeCorner(grd20: g, row18: 3, col18: 3)
                    proposeFreeMiddle(grd20: g)
                    
                default:
                    
                    proposeCorner(grd20: g, row18: 1, col18: 1)
                    proposeCorner(grd20: g, row18: 1, col18: 3)
                    proposeCorner(grd20: g, row18: 3, col18: 1)
                    proposeCorner(grd20: g, row18: 3, col18: 3)
                    proposeFreeMiddle(grd20: g)
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .deny:
                if test {
                    display(m2: testM, msg: "Deny strategy")
                } // end if
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomRC(grd20: g)
                default:
                    proposeRandomRC(grd20: g)
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .force:
                if test {
                    display(m2: testM, msg: "Force strategy")
                } // end if
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    
                    proposeRandomRC(grd20: g)
                    
                default:
                    
                    proposeRandomRC(grd20: g)
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .corner:
                if test {
                    display(m2: testM, msg: "Corner strategy")
                } // end if
                switch count(grd8: g, tok8: ex, oh) {
                case 0:
                    
                    proposeCorner(grd20: g, row18: 1, col18: 1)
                    
                case 1:
                    
                    if isSquareTaken(grd10: g, row10: 1, col10: 1) {
                        proposeCorner(grd20: g, row18: 3, col18: 3)
                    } else if isSquareTaken(grd10: g, row10: 1, col10: 3) {
                        proposeCorner(grd20: g, row18: 3, col18: 1)
                    } else if isSquareTaken(grd10: g, row10: 3, col10: 3) {
                        proposeCorner(grd20: g, row18: 1, col18: 3)
                    } else if isSquareTaken(grd10: g, row10: 3, col10: 3) {
                        proposeCorner(grd20: g, row18: 1, col18: 1)
                    } // end if
                    
                default:
                    
                    proposeRandomRC(grd20: g)
                    if isSquareTaken(grd10: g, row10: 1, col10: 1) {
                        proposeCorner(grd20: g, row18: 3, col18: 3)
                    } else if isSquareTaken(grd10: g, row10: 1, col10: 3) {
                        proposeCorner(grd20: g, row18: 3, col18: 1)
                    } else if isSquareTaken(grd10: g, row10: 3, col10: 3) {
                        proposeCorner(grd20: g, row18: 1, col18: 3)
                    } else if isSquareTaken(grd10: g, row10: 3, col10: 3) {
                        proposeCorner(grd20: g, row18: 1, col18: 1)
                    } // end if
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .keyboard:
                if test {
                    display(m2: testM, msg: "Keyboard strategy")
                } // end if
                RCLoop: repeat {
                    rowLoop: repeat {
                        display(msg: pMsg[4])
                        display(msg: pMsg[5], trm: "")
                        tempS1 = readLine(strippingNewline: true)!
                        if tempS1 == "Q" || tempS1 == "q" {
                            continueFlag = false
                            break RCLoop
                        } else if tempS1.isInt {
                            tempR = Int(tempS1)!
                            break rowLoop
                        } else {
                            errorOutOfRange(upper: 3)
                        } // end if
                    } while tempR < 1 || tempR > 3 // end rowLoop
                    
                    colLoop: repeat {
                        display(msg: pMsg[6])
                        display(msg: pMsg[5], trm: "")
                        tempS1 = readLine(strippingNewline: true)!
                        if tempS1 == "Q" || tempS1 == "q" {
                            continueFlag = false
                            break RCLoop
                        } else if tempS1.isInt {
                            tempC = Int(tempS1)!
                            break colLoop
                        } else {
                            errorOutOfRange(upper: 3)
                        } // end if
                    } while tempC < 1 || tempC > 3 // end rowLoop
                    
                    if isSquareTaken(grd10: g, row10: tempI1, col10: tempI2) {
                        display(msg: pMsg[7])
                        display(msg: pMsg[8])
                    } // end if
                    
                } while isSquareTaken(grd10: g, row10: tempI1, col10: tempI2) // end RCLoop
                
                tempRC = [tempR, tempC]
            } // end switch strategy
            proposeTempG(grd21: g)
            return continueFlag
        } // end continueProposeRCorG() -> Bool
        
        func continueProposeGrid() -> Bool {
            // returns (continueFlag, proposeFlag)
            // must set g = tempG on return
            
            func proposeRandomGrid() {
                repeat {
                    tempG = Int.random(in: 1 ... 9)
                } while hasTTTinGrid(grd3: tempG, tok3: ex, oh) != 0 || isGridDraw(grd15: tempG)
            } // end func getRandomGrid()
            
            // C H O O S E P R O P O S E G R I D   C O D E   H E R E
            // returns (continueFlag, proposeFlag)
            // continueFlag: continue = true; quit = false
            // proposeFlag: tempG is proposed = true: tempG is not proposed = false
            // must set g = tempG on return
            
            continueFlag = true
            // proposeFlag = false
            
            switch playerCurrent.strategy {
            case .random:
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .middle:
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomGrid()
                    
                default:
                    proposeRandomGrid()
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .deny:
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .force:
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
                /*
                 let goodGrids = Set([1,3,7,9])
                 let badGrids = Set([2,4,6,8])
                 let idkGrid = Set([5])
                 
                 forceLoop: for i in goodGrids {
                 for j in 1...3 {
                 for k in 1...3 {
                 if badGrids.contains((j-1)*3+k) {
                 pnt = [i,j,k]
                 break forceLoop
                 } // end badGrids
                 
                 } // end k
                 
                 } // end j
                 
                 } // end i
                 
                 if pnt == [0,0,0] { // then there is no option in goodGrids that forces a badGrid
                 print("Force strategy out of options")
                 // break bigLoop
                 } else {
                 pnt = [i,j,k]
                 } // end if
                 
                 // return pnt[0]
                 tempI1 = pnt[0]
                 
                 */
            case .corner:
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .keyboard:
                
                outerGridLoop: repeat {
                    innerGridLoop: repeat {
                        display(msg: pMsg[2]) // What grid to play
                        display(msg: pMsg[3], trm: "")
                        tempS1 = readLine(strippingNewline: true)!
                        if tempS1 == "Q" || tempS1 == "q" {
                            continueFlag = false
                        } else if tempS1.isInt {
                            tempG = Int(tempS1)!
                            break innerGridLoop
                        } else {
                            errorOutOfRange(upper: 9)
                        } // end if
                    } while tempG < 1 || tempG > 9 // end innerGridLoop
                    if hasTTTinGrid(grd3: tempG, tok3: ex, oh) != 0 {
                        display(msg: mMsg[10]) // already a TTT
                        display(msg: mMsg[9]) // please try again
                    } else if count(grd8: tempI1, tok8: ex, oh) == 9 {
                        display(msg: mMsg[11]) // already a draw
                        display(msg: mMsg[9]) // please try again
                    } else {
                        break outerGridLoop
                    } // end if
                } while hasTTTinGrid(grd3: tempG, tok3: ex, oh) != 0 || count(grd8: tempG, tok8: ex, oh) == 9 // end outerGridLoop
            } // end switch strategy
            return continueFlag
        } // end  func chooseProposeGrid() -> (continueFlag, proposeFlag)
        
        func convertGridToRC(grd22: Int) -> [Int] {
            if grd22 == 1 {
                tempRC = [1, 1]
            } else if grd22 == 2 {
                tempRC = [1, 2]
            } else if grd22 == 3 {
                tempRC = [1, 3]
            } else if grd22 == 4 {
                tempRC = [2, 1]
            } else if grd22 == 5 {
                tempRC = [2, 2]
            } else if grd22 == 6 {
                tempRC = [2, 3]
            } else if grd22 == 7 {
                tempRC = [3, 1]
            } else if grd22 == 8 {
                tempRC = [3, 2]
            } else if grd22 == 9 {
                tempRC = [3, 3]
            } // end if
            return tempRC
        } // end func convertGridToRC(grd22: Int)
        
        func markBigBoard(grd17: Int, tok17: String) {
            tempRC = convertGridToRC(grd22: grd17)
            game[pos(pt1: [bigBoard, tempRC[0], tempRC[1]])] = tok17
        } // end func markBigBoard(grd17: Int, tok17: String)
        
        func clearGrid(grd11: Int) {
            for i in 0 ... 8 {
                game[grd11 * 9 + i] = " "
            } // end for i
        } // end func clearGrid(grd11: Int, char: String)
        
        func markTokenInGrid(grd16: Int, tok16: String) {
            // clear Grid
            clearGrid(grd11: grd16)
            if tok16 == ex {
                game[grd16 * 9 + 0] = tok16
                game[grd16 * 9 + 2] = tok16
                game[grd16 * 9 + 4] = tok16
                game[grd16 * 9 + 6] = tok16
                game[grd16 * 9 + 8] = tok16
            } else if tok16 == oh {
                game[grd16 * 9 + 0] = tok16
                game[grd16 * 9 + 1] = tok16
                game[grd16 * 9 + 2] = tok16
                game[grd16 * 9 + 3] = tok16
                game[grd16 * 9 + 5] = tok16
                game[grd16 * 9 + 6] = tok16
                game[grd16 * 9 + 7] = tok16
                game[grd16 * 9 + 8] = tok16
            } else if tok16 == draw {
                game[grd16 * 9 + 0] = tok16
                game[grd16 * 9 + 1] = tok16
                game[grd16 * 9 + 2] = tok16
                game[grd16 * 9 + 4] = tok16
                game[grd16 * 9 + 7] = tok16
            } // end if
        } // end func markTokenInGrid(grd16: Int, tok16: String)
        
        func clearGrids() {
            for x in 1 ... 9 {
                clearGrid(grd11: x)
            } // end for
        } // end func clearGrids
        
        func markGrids() {
            for x in 1 ... 9 { // for each numbered grid
                for y in 1 ... 3 { // for each row in bigBoard
                    for z in 1 ... 3 { // for each col in bigBoard
                        if game[pos(pt1: [bigBoard, y, z])] == ex { // mark ex
                            markTokenInGrid(grd16: x, tok16: ex)
                        } else if game[pos(pt1: [bigBoard, y, z])] == oh { // mark oh
                            markTokenInGrid(grd16: x, tok16: oh)
                        } else if game[pos(pt1: [bigBoard, y, z])] == draw { // mark draw
                            markTokenInGrid(grd16: x, tok16: draw)
                        } // end if mark tokens
                    } // end for z
                } // end for y
            } // end for x
        } // end func markGrids()
        
        func switchPlayers() {
            // print("p = \(player) p1 = \(player1.name), p2 = \(player2.name)")
            
            if playerCurrent.name == player1.name { // Player1 is the current player
                playerCurrent.name = player2.name
                playerCurrent.token = player2.token
                playerCurrent.oppToken = player1.token
                playerCurrent.type = player2.type
                playerCurrent.strategy = player2.strategy
            } else { // Player2 is the current player
                playerCurrent.name = player1.name
                playerCurrent.token = player1.token
                playerCurrent.oppToken = player2.token
                playerCurrent.type = player1.type
                playerCurrent.strategy = player1.strategy
            } // end if
            if testBrain {
                // display(msg: testSpc+"Player is \(player). Type is \(type). Token is \(token).")
            } // end if
        } // end func switchPlayers
        
        func determineNextGrid() {
            /*
             tempI1 = (r-1)*3 + c
             if (hasTTTinGrid(grd3: tempI1, tok3: ex, oh) == 0 || !isGridDraw(grd15: tempI1) { // no TTT or Draw in this grid
             g = tempI1
             nL()
             display(msg: icnWarning + "\(playerCurrent.name)"+pMsg[15]+"\(g)!")
             } else {
             if !continueProposeGrid() {
             break gameLoop
             } else {
             g = tempG
             nL()
             display(msg: icnInfo + "\(playerCurrent.name)"+pMsg[16]+"\(g)")
             } // end if
             
             } // end if
             */
        } // end func determineNextGrid
        
        // C O N T I N U E P L A Y   C O D E   H E R E
        
        againLoop: repeat {
            gameLoop: repeat {
                continueFlag = true
                displayOpeningInfo()
                // if gamesTotal > 1 include stats?
                // openingInfo()
                
                // show the empty board and pauseIt
                displayGame(tag: false)
                if tempS1 == "Q" || tempS1 == "q" {
                    nL2()
                    display(msg: mMsg[12])
                    continueFlag = false
                    break gameLoop
                } // end if
                
                // opening grid is choice of first player
                continueFlag = continueProposeGrid()
                if !continueFlag {
                    break gameLoop
                } else {
                    g = tempG
                } // end if
                
                moveLoop: repeat {
                    // getRC()
                    // tempFlags = chooseProposeRC()
                    continueFlag = continueProposeRCorG()
                    if !continueFlag {
                        break gameLoop
                    } else {
                        rc = tempRC
                        r = rc[0]
                        c = rc[1]
                    } // end if
                    
                    // move
                    game[pos(pt1: [g, r, c])] = playerCurrent.token
                    
                    // if TTT in Grid
                    if hasTTTinGrid(grd3: g, tok3: playerCurrent.token) != 0 {
                        // notify
                        nL()
                        display(msg: icnHand + "\(playerCurrent.name)" + pMsg[9] + "\(g) !")
                        
                        // mark bigBoard
                        markBigBoard(grd17: bigBoard, tok17: playerCurrent.token)
                        
                        // mark Token in Grid
                        markTokenInGrid(grd16: g, tok16: playerCurrent.token)
                        
                        // if TTT in Game
                        if hasTTTinGrid(grd3: bigBoard, tok3: playerCurrent.token) != 0 {
                            // game is over
                            
                            // notify
                            nL()
                            display(msg: pMsg[10] + "\(playerCurrent.name)" + pMsg[11])
                            
                            // clear grids
                            clearGrids()
                            
                            // mark boards with TTTs and Draws
                            markGrids()
                            
                            // print it!
                            displayGame(tag: true)
                            
                            // count win and loss
                            gameCount += 1
                            if playerCurrent.name == player1.name {
                                player1.gamesWon += 1
                                player2.gamesLost += 1
                            } else {
                                player2.gamesWon += 1
                                player1.gamesLost += 1
                            } // end if
                            
                            break gameLoop
                        } // end if hasTTT in Grid = 0 ie Game
                        
                        // if Draw in Grid
                    } else if isGridDraw(grd15: g) {
                        // notify
                        nL()
                        display(msg: pMsg[12] + "\(g)" + pMsg[13]) // Grid is a draw
                        
                        // mark bigBoard
                        markBigBoard(grd17: bigBoard, tok17: draw)
                        
                        // mark Token in Grid
                        markTokenInGrid(grd16: g, tok16: draw)
                        
                        // if Draw in Game
                        if isGridDraw(grd15: bigBoard) {
                            // game is over
                            
                            // notify
                            nL()
                            display(msg: pMsg[14])
                            
                            // clear grids
                            clearGrids()
                            
                            // mark boards with TTTs and Draws
                            markGrids()
                            
                            // print it!
                            displayGame(tag: true)
                            
                            // count draw
                            gameCount += 1
                            player1.gamesDrawn += 1
                            player2.gamesDrawn += 1
                            
                            break gameLoop
                        } // end if isDrawInGrid
                    } // end if TTT in Grid
                    
                    switchPlayers()
                    
                    determineNextGrid()
                    
                } while continueFlag // end moveLoop ==> check this condition
                
                display(msg:pMsg[17])
                display(m2: tab2, msg: mMsg[13]+mMsg[19]) // Yes
                display(m2: tab2, msg: mMsg[14] + mMsg[20]) // 2) No
                display(msg: mMsg[21]+mMsg[22])
                tempS1 = readLine(strippingNewline: true)!
                if tempS1 == "Q" || tempS1 == "q" {
                    nL2()
                    display(msg: mMsg[12]) //  Elected to quit
                    continueFlag = false
                    break gameLoop
                } else if tempS1.isInt {
                    tempI1 = Int(tempS1)!
                    if tempI1 == 1 {
                        // notifyToken()
                        break gameLoop
                    } else if tempI1 == 2 {
                        nL2()
                        display(msg: mMsg[12]) // Quit message
                        continueFlag = false
                        break againLoop
                    } // end if
                } else {
                    errorOutOfRange(upper: 2)
                } // end if

            } while continueFlag // end gameLoop
            
        } while continueFlag // end againLoop <== check this
        return continueFlag
    } // end func continuePlay
} // end struct PlayGame
