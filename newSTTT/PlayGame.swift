//
//  PlayGame.swift
//  newSTTT
//
//  Created by Jack Karp on 7/9/25.
//

// P L A Y G A M E   S T R U C T
struct PlayGame {
    // PLAYGAME Constants, Variables, Functions
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
        icnExclam + "Do you want to play again?", // 17 Play again
        ", it's your turn.", // 18 it's your turn
        ", you played ", // 19, you played
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
    var proposeFlag = false

    // P L A Y G A M E   F U N C T I O N S
    mutating func continuePlay() -> Bool {
        func pos(pt1: [Int]) -> Int {
            // pos returns the index to the array game
            // pt1 is the matrix [grid, row, column]
            // 0 >= grid <= 9
            // 1 >= row <= 3
            // 1 >= column <= 3
            // 0 >= return <= 89
            if pt1[0] < 0 || pt1[0] > 9 || pt1[1] < 1 || pt1[1] > 3 || pt1[2] < 1 || pt1[2] > 3 {
                display(m2: tab2, msg: "Func: pos. Error: grid = \(pt1[0]); row = \(pt1[1]); column = \(pt1[2]). Out of range.")
            } // end if
            return pt1[0] * 9 + (pt1[1] - 1) * 3 + pt1[2] - 1
        } // end func pos(pt1: [Int]) -> Int

        func displayGameStats() {
            // display(m2: testM, msg: "Inside displayGameStats")
            var temp1 = player1.name
            var temp2 = player2.name

            while temp1.count < 18 {
                temp1 = temp1 + " "
                // display(m2: testM, msg: "Inside temp1")
            } // end while
            while temp2.count < 18 {
                temp2 = temp2 + " "
                // display(m2: testM, msg: "Inside temp2")
            } // end while
            var gW1 = String(player1.gamesWon)
            var gL1 = String(player1.gamesLost)
            var gD1 = String(player1.gamesDrawn)
            var gW2 = String(player2.gamesWon)
            var gL2 = String(player2.gamesLost)
            var gD2 = String(player2.gamesDrawn)
            var gC = String(gameCount)

            while gW1.count < 8 {
                gW1 = " " + gW1
                // display(m2: testM, msg: "Inside gW1")
            } // end while
            while gL1.count < 8 {
                gL1 = " " + gL1
                // display(m2: testM, msg: "Inside gL1")
            } // end while
            while gD1.count < 8 {
                gD1 = " " + gD1
                // display(m2: testM, msg: "Inside gD1")
            } // end while
            while gW2.count < 8 {
                gW2 = " " + gW2
                // display(m2: testM, msg: "Inside gW2")
            } // end while
            while gL2.count < 8 {
                gL2 = " " + gL2
                // display(m2: testM, msg: "Inside gL2")
            } // end while
            while gD2.count < 8 {
                gD2 = " " + gD2
                // display(m2: testM, msg: "Inside gD2")
            } // end while
            while gC.count < 8 {
                gC = " " + gC
                // display(m2: testM, msg: "Inside gC")
            } // end while

            display(msg: icnHand + "G A M E   S T A T I S T I C S")
            display(msg: "                        Won    Lost   Drawn   Total")
            display(msg: temp1 + gW1 + gL1 + gD1 + gC)
            display(msg: temp2 + gW2 + gL2 + gD2 + gC)
        } // end displayGameStats()

        func displayOpeningInfo() {
            nL()
            display(msg: mMsg[5]) // This match

            if player1.goesFirst { // player1 goes first
                if player1.type == "machine" {
                    tempS1 = ", with strategy \(player1.strategy.rawValue)"
                } else {
                    tempS1 = ""
                } // end if
                display(m2: tab2, msg: icnInfo + player1.name + " playing " + player1.token + tempS1) // player1 stats

                display(m2: tab2 + tab2, msg: mMsg[6]) // v.

                if player2.type == "machine" {
                    tempS1 = ", with strategy \(player2.strategy.rawValue)"
                } else { //
                    tempS1 = ""
                } // end if
                display(m2: tab2, msg: icnInfo + player2.name + " playing " + player2.token + tempS1, trm: "") // player2 stats

            } else { // player 2 goes first
                if player2.type == "machine" {
                    tempS1 = ", with strategy \(player2.strategy.rawValue)"
                } else {
                    tempS1 = ""
                } // end if
                display(m2: tab2, msg: icnInfo + player2.name + " playing " + player2.token + tempS1) // player2 stats
                display(m2: tab2 + tab2, msg: mMsg[6]) // v.
                if player1.type == "machine" {
                    tempS1 = ", with strategy \(player1.strategy.rawValue)"
                } else {
                    tempS1 = ""
                } // end if
                display(m2: tab2, msg: icnInfo + player1.name + " playing " + player1.token + tempS1, trm: "") // player1 stats
            } // end if goFirst
            nL()
            if gameCount >= 1 {
                displayGameStats()
            } // end if
        } // end func displayOpeningInfo()

        func hasTTTinGrid(grd3: Int, tok3: String...) -> Int? {
            // if tttGrid == nil there is no TTT, else tttGrid != nil there is a TTT
            // tttGrid is the number that corresponds to which TTT (eg: 1=row1; 2=row2; 3=row3; 4=col1; 5=col2; 6=col3; 7=LtoR diag; 8=RtoL diag)
            var tttGrid: Int?
            for w in tok3 {
                if game[pos(pt1: [grd3, 1, 1])] == w && game[pos(pt1: [grd3, 1, 2])] == w && game[pos(pt1: [grd3, 1, 3])] == w { // TTT in row 1
                    tttGrid = 1
                } else if game[pos(pt1: [grd3, 2, 1])] == w && game[pos(pt1: [grd3, 2, 2])] == w && game[pos(pt1: [grd3, 2, 3])] == w { // TTT in row 2
                    tttGrid = 2
                } else if game[pos(pt1: [grd3, 3, 1])] == w && game[pos(pt1: [grd3, 3, 2])] == w && game[pos(pt1: [grd3, 3, 3])] == w { // TTT in row 3
                    tttGrid = 3
                } else if game[pos(pt1: [grd3, 1, 1])] == w && game[pos(pt1: [grd3, 2, 1])] == w && game[pos(pt1: [grd3, 3, 1])] == w { // TTT in col 1
                    tttGrid = 4
                } else if game[pos(pt1: [grd3, 1, 2])] == w && game[pos(pt1: [grd3, 2, 2])] == w && game[pos(pt1: [grd3, 3, 2])] == w { // TTT in col 2
                    tttGrid = 5
                } else if game[pos(pt1: [grd3, 1, 3])] == w && game[pos(pt1: [grd3, 2, 3])] == w && game[pos(pt1: [grd3, 3, 3])] == w { // TTT in col 3
                    tttGrid = 6
                } else if game[pos(pt1: [grd3, 1, 1])] == w && game[pos(pt1: [grd3, 2, 2])] == w && game[pos(pt1: [grd3, 3, 3])] == w { // TTT in LR diagonal
                    tttGrid = 7
                } else if game[pos(pt1: [grd3, 1, 3])] == w && game[pos(pt1: [grd3, 2, 2])] == w && game[pos(pt1: [grd3, 3, 1])] == w { // TTT in RL diagonal
                    tttGrid = 8
                } // end if
            } // end w
            return tttGrid
        } // end func hasTTTinGrid(grd3: Int, tok3: String...) -> Int?

        func count(grd8: Int, tok8: String...) -> Int { // counts tokens in the grid
            var c = 0
            if grd8 < 0 || grd8 > 9 {
                display(m2: tab2, msg: "Func: count. Error: grid = \(grd8). Out of range.")
            } else {
                for j in tok8 {
                    for i in 0 ... 8 { // for each cell in the grid
                        if game[grd8 * 9 + i] == j {
                            c += 1
                        } // end if
                    } // end for i
                } // end for j
            } // end if
            return c
        } // end func count

        func isGridDraw(grd15: Int) -> Bool {
            if grd15 < 1 || grd15 > 9 {
                display(m2: tab2, msg: "Func: isGridDraw. Error: grid = \(grd15). Out of range.")
            } else if grd15 == 0 {
                display(m2: tab2, msg: "Func: isGridDraw. Error: grid = \(grd15). Out of range.")
            } // end if
            
            // end if
            if game[pos(pt1: [bigBoard, convertGridToRC(grd22: grd15, txt22: "IsGridDraw")[0], convertGridToRC(grd22: grd15, txt22: "IsGridDraw")[1]])] == draw {
                return true // draw
            } else { // 
                return false // no draw
            } // end if
        } // end func isGridDraw(grd15) -> Bool
        
        /* func isGridDraw(grd15: Int) -> Bool {
            if count(grd8: grd15, tok8: ex, oh) == 9 {
                return true // draw
            } else { // no TTT and count = 9
                return false // no draw
            } // end if
        } // end func isGridDraw(grd15) -> Bool */

        func displayBigBoard() {
            print("""
                    \n\t\t\(testM)\(game[pos(pt1: [0, 1, 1])])\(sp2)\(game[pos(pt1: [0, 1, 2])])\(sp2)\(game[pos(pt1: [0, 1, 3])])\n\t\t\(testM)\(game[pos(pt1: [0, 2, 1])])\(sp2)\(game[pos(pt1: [0, 2, 2])])\(sp2)\(game[pos(pt1: [0, 2, 3])])\n\t\t\(testM)\(game[pos(pt1: [0, 3, 1])])\(sp2)\(game[pos(pt1: [0, 3, 2])])\(sp2)\(game[pos(pt1: [0, 3, 3])])
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
                    if grd6 < 0 || grd6 > 9 {
                        display(m2: tab2, msg: "Func: printGridLabel. Error: grid = \(grd6). Out of range.")
                    } // end if
                    if (hasTTTinGrid(grd3: grd6, tok3: ex) != nil) || hasTTTinGrid(grd3: grd6, tok3: oh) != nil || isGridDraw(grd15: grd6) || grd6 != 0 {
                        return sp7
                    } else { // is big grid TTT
                        return "Grid" + sp1 + String(grd6) + sp1
                    } // end if
                } // end func printGridLabel

                // F O R M L A B E L L I N E   C O D E   H E R E
                if grd14 < 0 || grd14 > 9 {
                    display(m2: tab2, msg: "Func: formLabelLine. Error: grid = \(grd14). Out of range.")
                } // end if
                if hasTTTinGrid(grd3: bigBoard, tok3: ex) != nil || hasTTTinGrid(grd3: bigBoard, tok3: oh) != nil {
                    // ADD || isGridDraw || grd14 != 0       ?!?
                    return ""
                } else {
                    return "\(tab2)\(sp6)\(printGridLabel(grd6: grd14))\(sp1)\(bar)\(sp3)\(printGridLabel(grd6: grd14 + 1))\(sp1)\(bar)\(sp3)\(printGridLabel(grd6: grd14 + 2))\n"
                } // end if
            } // end func formLabelLine

            func printSpacers() -> String {
                if hasTTTinGrid(grd3: bigBoard, tok3: ex) != nil || hasTTTinGrid(grd3: bigBoard, tok3: oh) != nil || isGridDraw(grd15: bigBoard) {
                    return ""
                } else {
                    return "\(sp10)\(bar)\(sp11)\(bar)"
                } // end if
            } // end func printSpacers

            // D I S P L A Y G A M E   C O D E   H E R E
            // newLine()
            display(msg: """
                \n\(sp11)\(sp1)\(printSpacers())\n\(formLabelLine(grd14: 1))\(sp11)\(sp2)\(game[pos(pt1: [1, 1, 1])])\(sp2)\(game[pos(pt1: [1, 1, 2])])\(sp2)\(game[pos(pt1: [1, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [2, 1, 1])])\(sp2)\(game[pos(pt1: [2, 1, 2])])\(sp2)\(game[pos(pt1: [2, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [3, 1, 1])])\(sp2)\(game[pos(pt1: [3, 1, 2])])\(sp2)\(game[pos(pt1: [3, 1, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [1, 2, 1])])\(sp2)\(game[pos(pt1: [1, 2, 2])])\(sp2)\(game[pos(pt1: [1, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [2, 2, 1])])\(sp2)\(game[pos(pt1: [2, 2, 2])])\(sp2)\(game[pos(pt1: [2, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [3, 2, 1])])\(sp2)\(game[pos(pt1: [3, 2, 2])])\(sp2)\(game[pos(pt1: [3, 2, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [1, 3, 1])])\(sp2)\(game[pos(pt1: [1, 3, 2])])\(sp2)\(game[pos(pt1: [1, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [2, 3, 1])])\(sp2)\(game[pos(pt1: [2, 3, 2])])\(sp2)\(game[pos(pt1: [2, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [3, 3, 1])])\(sp2)\(game[pos(pt1: [3, 3, 2])])\(sp2)\(game[pos(pt1: [3, 3, 3])])\n\(tab2)\(sp4)\(horiz)\n\(formLabelLine(grd14: 4))\(sp11)\(sp2)\(game[pos(pt1: [4, 1, 1])])\(sp2)\(game[pos(pt1: [4, 1, 2])])\(sp2)\(game[pos(pt1: [4, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [5, 1, 1])])\(sp2)\(game[pos(pt1: [5, 1, 2])])\(sp2)\(game[pos(pt1: [5, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [6, 1, 1])])\(sp2)\(game[pos(pt1: [6, 1, 2])])\(sp2)\(game[pos(pt1: [6, 1, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [4, 2, 1])])\(sp2)\(game[pos(pt1: [4, 2, 2])])\(sp2)\(game[pos(pt1: [4, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [5, 2, 1])])\(sp2)\(game[pos(pt1: [5, 2, 2])])\(sp2)\(game[pos(pt1: [5, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [6, 2, 1])])\(sp2)\(game[pos(pt1: [6, 2, 2])])\(sp2)\(game[pos(pt1: [6, 2, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [4, 3, 1])])\(sp2)\(game[pos(pt1: [4, 3, 2])])\(sp2)\(game[pos(pt1: [4, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [5, 3, 1])])\(sp2)\(game[pos(pt1: [5, 3, 2])])\(sp2)\(game[pos(pt1: [5, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [6, 3, 1])])\(sp2)\(game[pos(pt1: [6, 3, 2])])\(sp2)\(game[pos(pt1: [6, 3, 3])])\n\(tab2)\(sp4)\(horiz)\n\(formLabelLine(grd14: 7))\(sp11)\(sp2)\(game[pos(pt1: [7, 1, 1])])\(sp2)\(game[pos(pt1: [7, 1, 2])])\(sp2)\(game[pos(pt1: [7, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [8, 1, 1])])\(sp2)\(game[pos(pt1: [8, 1, 2])])\(sp2)\(game[pos(pt1: [8, 1, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [9, 1, 1])])\(sp2)\(game[pos(pt1: [9, 1, 2])])\(sp2)\(game[pos(pt1: [9, 1, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [7, 2, 1])])\(sp2)\(game[pos(pt1: [7, 2, 2])])\(sp2)\(game[pos(pt1: [7, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [8, 2, 1])])\(sp2)\(game[pos(pt1: [8, 2, 2])])\(sp2)\(game[pos(pt1: [8, 2, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [9, 2, 1])])\(sp2)\(game[pos(pt1: [9, 2, 2])])\(sp2)\(game[pos(pt1: [9, 2, 3])])\n\(sp11)\(sp2)\(game[pos(pt1: [7, 3, 1])])\(sp2)\(game[pos(pt1: [7, 3, 2])])\(sp2)\(game[pos(pt1: [7, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [8, 3, 1])])\(sp2)\(game[pos(pt1: [8, 3, 2])])\(sp2)\(game[pos(pt1: [8, 3, 3])])\(sp2)\(bar)\(sp2)\(game[pos(pt1: [9, 3, 1])])\(sp2)\(game[pos(pt1: [9, 3, 2])])\(sp2)\(game[pos(pt1: [9, 3, 3])])\n\(sp11)\(sp1)\(printSpacers())
            """) // end display("""
            if testBigBoard {
                // nL()
                displayBigBoard()
            } // end if
            // nL()
            display(msg: mMsg[7], trm: "")
            if !mmFlag || test || testOT { // pause for Return in either human game, test, testOT
                tempS1 = readLine(strippingNewline: true)!
            } else { // don't pause for return in MM game
                tempS1 = ""
            } // end if
            if test {
                // display(m2: testSpcM, msg: "Inside displayGame: continueFlag = \(continueFlag); tempS1 = \(tempS1)")
            } // end if test
        } // end func displayGame()

        func meaningless() {
            print("meaningless")
        } // end func meaningless

        func isSquareTaken(grd10: Int, row10: Int, col10: Int) -> Bool {
            if grd10 < 0 || grd10 > 9 || row10 < 1 || row10 > 3 || col10 < 1 || col10 > 3 {
                display(m2: tab2, msg: "Func: isSquareTaken. Error: grid = \(grd10); row = \(row10); column = \(col10). Out of range.")
            } // end if
            if game[pos(pt1: [grd10, row10, col10])] == under { // tests for under
                return false
            } else {
                return true
            } // end if
        } // end func isSquareTaken(grd10: Int, row10: Int, col10: Int) -> Bool

        func proposeOorT(grd12: Int, tok12: String, grid: Bool) {
            //  Opportunity = called with token
            //  Threat = called with oppToken
            // called with both playerCurrent.oppToken and playerCurrent.token checks first for threats, then for opportunities in one call
            // returns proposeFlag
            func testOTG(prefix: String, loc: String) {
                if testOT {
                    if testBrain {
                        display(m2: testOTM, msg: "\(prefix)OTG: flag: \(proposeFlag) | tempG: \(tempG) \(loc)")
                    } // end if
                } // end if
            } // end func testOTG()
            func testOTRC(prefix: String, loc: String) {
                if testOT {
                    if testBrain {
                        display(m2: testOTM, msg: "\(prefix)OTRC: propose: \(proposeFlag) | tempRC: \(tempRC) \(loc)")
                    } // end if
                } // end if
            } // end func testOTG()
            
            if grd12 < 0 || grd12 > 9 {
                display(m2: tab2, msg: "Func: proposeOorT. Error: grid = \(grd12). Out of range.")
            } // end if
            proposeFlag = false
            if grid {
                testOTG(prefix: R, loc: "Start")
            } else {
                testOTRC(prefix: R, loc: "Start")
            } // end if
            if (game[pos(pt1: [grd12, 1, 1])] == tok12 && game[pos(pt1: [grd12, 1, 2])] == tok12 && game[pos(pt1: [grd12, 1, 3])] == under) ||
                (game[pos(pt1: [grd12, 2, 3])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == tok12 && game[pos(pt1: [grd12, 1, 3])] == under) ||
                (game[pos(pt1: [grd12, 2, 2])] == tok12 && game[pos(pt1: [grd12, 3, 1])] == tok12 && game[pos(pt1: [grd12, 1, 3])] == under) {
                // row 1, 11, 12, -> 13
                // col 3, 23, 33 -> 13
                // diag R to L, 22, 31 -> 13
                proposeFlag = true
                if grid {
                    tempG = 3
                    testOTG(prefix: L, loc: "Row1, Col3, DiagRtoL")
                } else {
                    tempRC = [1, 3]
                    tempR = 1
                    tempC = 3
                    testOTRC(prefix: L, loc: "Row1, Col3, DiagRtoL")
                } // end if
            } else if (game[pos(pt1: [grd12, 1, 1])] == tok12 && game[pos(pt1: [grd12, 1, 3])] == tok12 && game[pos(pt1: [grd12, 1, 2])] == under) ||
                (game[pos(pt1: [grd12, 2, 1])] == tok12 && game[pos(pt1: [grd12, 3, 1])] == tok12 && game[pos(pt1: [grd12, 1, 1])] == under) {
                // row 1, 11, 13 -> 12
                // col 2, 22, 32 -> 12
                proposeFlag = true
                if grid {
                    tempG = 2
                    testOTG(prefix: L, loc: "Row1, Col2")
                } else {
                    tempRC = [1, 2]
                    tempR = 1
                    tempC = 2
                    testOTRC(prefix: L, loc: "Row1, Col2")
                } // end if
            } else if (game[pos(pt1: [grd12, 1, 2])] == tok12 && game[pos(pt1: [grd12, 1, 3])] == tok12 && game[pos(pt1: [grd12, 1, 1])] == under) ||
                (game[pos(pt1: [grd12, 2, 1])] == tok12 && game[pos(pt1: [grd12, 3, 1])] == tok12 && game[pos(pt1: [grd12, 1, 1])] == under) ||
                (game[pos(pt1: [grd12, 2, 2])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == tok12 && game[pos(pt1: [grd12, 1, 1])] == under) {
                // row 1, 12, 13 -> 11
                // col 1, 21, 31 -> 11
                // diag L to R, 22, 33 -> 11
                proposeFlag = true
                if grid {
                    tempG = 1
                    testOTG(prefix: L, loc: "Row1, Col1, DiagLtoR")
                } else {
                    tempRC = [1, 1]
                    tempR = 1
                    tempC = 1
                    testOTRC(prefix: L, loc: "Row1, Col1, DiagLtoR")
                } // end if
            } else if (game[pos(pt1: [grd12, 2, 1])] == tok12 && game[pos(pt1: [grd12, 2, 2])] == tok12 && game[pos(pt1: [grd12, 2, 3])] == under) ||
                (game[pos(pt1: [grd12, 1, 3])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == tok12 && game[pos(pt1: [grd12, 2, 3])] == under) {
                // row 2, 21, 22, -> 23
                // col 3, 13, 33 -> 23
                proposeFlag = true
                if grid {
                    tempG = 6
                    testOTG(prefix: L, loc: "Row2, Col3")
                } else {
                    tempRC = [2, 3]
                    tempR = 2
                    tempC = 3
                    testOTRC(prefix: L, loc: "Row2, Col3")
                } // end if
            } else if (game[pos(pt1: [grd12, 2, 1])] == tok12 && game[pos(pt1: [grd12, 2, 3])] == tok12 && game[pos(pt1: [grd12, 2, 2])] == under) ||
                (game[pos(pt1: [grd12, 1, 2])] == tok12 && game[pos(pt1: [grd12, 3, 2])] == tok12 && game[pos(pt1: [grd12, 2, 2])] == under) ||
                (game[pos(pt1: [grd12, 1, 1])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == tok12 && game[pos(pt1: [grd12, 2, 2])] == under) ||
                (game[pos(pt1: [grd12, 1, 3])] == tok12 && game[pos(pt1: [grd12, 3, 1])] == tok12 && game[pos(pt1: [grd12, 2, 2])] == under) {
                // row 2, 21, 23 -> 22
                // col 2, 12, 32 -> 22
                // diag L to R, 11, 33 -> 22
                // diag R to L, 13, 31 -> 22
                proposeFlag = true
                if grid {
                    tempG = 5
                    testOTG(prefix: L, loc: "Row2, Col2, DiagLtoR, DiagRtoL")
                } else {
                    tempRC = [2, 2]
                    tempR = 2
                    tempC = 2
                    testOTRC(prefix: L, loc: "Row2, Col2, DiagLtoR, DiagRtoL")
                } // end if
            } else if (game[pos(pt1: [grd12, 2, 2])] == tok12 && game[pos(pt1: [grd12, 2, 3])] == tok12 && game[pos(pt1: [grd12, 2, 1])] == under) ||
                (game[pos(pt1: [grd12, 1, 1])] == tok12 && game[pos(pt1: [grd12, 3, 1])] == tok12 && game[pos(pt1: [grd12, 2, 1])] == under) {
                // row 2, 22, 23 -> 21
                // col 1, 11, 31 -> 21
                proposeFlag = true
                if grid {
                    tempG = 4
                    testOTG(prefix: L, loc: "Row2, Col1")
                } else {
                    tempRC = [2, 1]
                    tempR = 2
                    tempC = 1
                    testOTRC(prefix: L, loc: "Row2, Col1")
                } // end if
            } else if (game[pos(pt1: [grd12, 3, 1])] == tok12 && game[pos(pt1: [grd12, 3, 2])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == under) ||
                (game[pos(pt1: [grd12, 1, 3])] == tok12 && game[pos(pt1: [grd12, 2, 3])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == under) ||
                (game[pos(pt1: [grd12, 1, 1])] == tok12 && game[pos(pt1: [grd12, 2, 2])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == under) {
                // row 3, 31, 32, -> 33
                // col 3, 13, 23 -> 33
                // diag L to R, 11, 22 -> 33
                proposeFlag = true
                if grid {
                    tempG = 9
                    testOTG(prefix: L, loc: "Row3, Col3")
                } else {
                    tempRC = [3, 3]
                    tempR = 3
                    tempC = 3
                    testOTRC(prefix: L, loc: "Row3, Col3")
                } // end if
            } else if (game[pos(pt1: [grd12, 3, 1])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == tok12 && game[pos(pt1: [grd12, 3, 2])] == under) ||
                (game[pos(pt1: [grd12, 1, 2])] == tok12 && game[pos(pt1: [grd12, 2, 2])] == tok12 && game[pos(pt1: [grd12, 3, 2])] == under) {
                // row 3, 31, 33 -> 32
                // col 2, 12, 22 -> 32
                proposeFlag = true
                if grid {
                    tempG = 8
                    testOTG(prefix: L, loc: "Row3, Col2")
                } else {
                    tempRC = [3, 2]
                    tempR = 3
                    tempC = 2
                    testOTRC(prefix: L, loc: "Row3, Col2")
                } // end if
            } else if (game[pos(pt1: [grd12, 3, 2])] == tok12 && game[pos(pt1: [grd12, 3, 3])] == tok12 && game[pos(pt1: [grd12, 3, 1])] == under) ||
                (game[pos(pt1: [grd12, 1, 1])] == tok12 && game[pos(pt1: [grd12, 2, 1])] == tok12 && game[pos(pt1: [grd12, 3, 1])] == under) ||
                (game[pos(pt1: [grd12, 1, 3])] == tok12 && game[pos(pt1: [grd12, 2, 2])] == tok12 && game[pos(pt1: [grd12, 3, 1])] == under) {
                // row 3, 32, 33 -> 31
                // col 1, 11, 21 -> 31
                // diag R to L, 13, 22 -> 31
                proposeFlag = true
                if grid {
                    tempG = 7
                    testOTG(prefix: L, loc: "Row3, Col1, DiagRtoL")
                } else {
                    tempRC = [3, 1]
                    tempR = 3
                    tempC = 1
                    testOTRC(prefix: L, loc: "Row3, Col1, DiagnRtoL")
                } // end if
            } // end if
            if grid {
                testOTG(prefix: L, loc: "Finish")
            } else {
                testOTRC(prefix: L, loc: "Finish")
            } // end if
        } // end func proposeOorT

        func testPlayerCurrentStrategy() {
            if testBrain {
                display(m2: testM, msg: "\(playerCurrent.name)'s strategy: \(playerCurrent.strategy) Token: \(playerCurrent.token)")
            } // end if
        } // end func testPlayerCurrentStrategy
        
        func continueProposeGrid() -> Bool {
            // returns (continueFlag, proposeFlag)
            // must set g = tempG on return

            func testGridStrategy(prefix: String, type: Brain) {
                if testBrain {
                    display(m2: testM, msg: "\(prefix)Brain: \(type) tempG: \(tempG)")
                } // end if
            } // end func testStrategy(type: Brain)

            func testTempG(location: String) {
                if testBrain {
                    display(m2: testM, msg: "\(location): tempG: \(tempG)")
                } // end if
            } // end func testTempG(location: String)

            func proposeRandomGrid() {
                testGridStrategy(prefix: R, type: .random)
                repeat {
                    tempG = Int.random(in: 1 ... 9)
                } while hasTTTinGrid(grd3: tempG, tok3: ex) != nil || hasTTTinGrid(grd3: tempG, tok3: oh) != nil || isGridDraw(grd15: tempG)
                testGridStrategy(prefix: L, type: .random)
            } // end func getRandomGrid()

            func proposeSmallBoardOorTG() {
                for x in 1...9 {
                    if game[pos(pt1:[bigBoard, convertGridToRC(grd22: x, txt22: "proposeSmallBoardOorTG")[0], convertGridToRC(grd22: x, txt22: "proposeSmallBoardOorTG")[1]])] == under {
                        proposeOorT(grd12: x, tok12: playerCurrent.oppToken, grid: true)
                        proposeOorT(grd12: x, tok12: playerCurrent.token, grid: true)
                    } // end if
                } // end for
            } // end func proposeSmallBoards()
 
            /*func proposeSmallBoardOorTG() {
                for x in 1...9 {
                    if count(grd8: x, tok8: ex, oh) > 1  && hasTTTinGrid(grd3: x, tok3: ex) != nil && hasTTTinGrid(grd3: x, tok3: oh) != nil && !isGridDraw(grd15: x) {
                        proposeOorT(grd12: x, tok12: playerCurrent.oppToken, grid: true)
                        proposeOorT(grd12: x, tok12: playerCurrent.token, grid: true)
                    } // end if
                } // end for
            } // end func proposeSmallBoards() */

            // C H O O S E P R O P O S E G R I D   C O D E   H E R E
            // returns (continueFlag, proposeFlag)
            // continueFlag: continue = true; quit = false
            // proposeFlag: tempG is proposed = true: tempG is not proposed = false
            // must set g = tempG on return

            continueFlag = true
            // proposeFlag = false
            testPlayerCurrentStrategy()
            switch playerCurrent.strategy {
            case .random:
                proposeRandomGrid()
            case .smartRandom:
                switch count(grd8: bigBoard, tok8: ex, oh, draw) {
                case 0, 1:
                    proposeRandomGrid()
                    proposeSmallBoardOorTG()
                default:
                    proposeRandomGrid()
                    proposeOorT(grd12: bigBoard, tok12: playerCurrent.oppToken, grid: true)
                    proposeOorT(grd12: bigBoard, tok12: playerCurrent.token, grid: true)
                    if !proposeFlag {
                        proposeSmallBoardOorTG()
                    } // end if
                } // end switch count
            case .middle:
                meaningless()
                /*
                testGridStrategy(prefix: R, type: .middle)
                switch count(grd8: g, tok8: ex, oh, draw) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                testGridStrategy(prefix: L, type: .middle)
                */
            case .deny:
                testGridStrategy(prefix: R, type: .deny)
                switch count(grd8: bigBoard, tok8: ex, oh, draw) {
                case 0, 1:
                    tempG = g
                    repeat {
                        proposeRandomGrid()
                    } while tempG == g // end while
                default:
                    tempG = g
                    repeat {
                        proposeRandomGrid()
                    } while tempG == g // end while
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                testGridStrategy(prefix: L, type: .deny)
            case .force:
                meaningless()
                /*
                testGridStrategy(prefix: R, type: .force)
                switch count(grd8: g, tok8: ex, oh, draw) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
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
                testGridStrategy(prefix: L, type: .deny)
                */
            case .corner:
                meaningless()
                /*
                testGridStrategy(prefix: R, type: .corner)
                switch count(grd8: g, tok8: ex, oh, draw) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                testGridStrategy(prefix: L, type: .corner)
                */
            case .keyboard:
                testGridStrategy(prefix: R, type: .keyboard)
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
                    if hasTTTinGrid(grd3: tempG, tok3: ex, oh) != nil {
                        display(msg: mMsg[10]) // already a TTT
                        display(msg: mMsg[9]) // please try again
                    } else if count(grd8: tempI1, tok8: ex, oh, draw) == 9 {
                        display(msg: mMsg[11]) // already a draw
                        display(msg: mMsg[9]) // please try again
                    } else {
                        break outerGridLoop
                    } // end if
                } while hasTTTinGrid(grd3: tempG, tok3: ex, oh) != nil || count(grd8: tempG, tok8: ex, oh, draw) == 9 // end outerGridLoop
                testGridStrategy(prefix: L, type: .keyboard)
            } // end switch strategy
            // tempG is proposed
            nL2()
            display(msg: icnInfo + "\(playerCurrent.name)\(pMsg[16]) \(tempG).") // player selected grid #
            return continueFlag
        } // end  func continueProposeGrid() -> Bool

        func continueProposeRC() -> Bool {
            // returns continueFlag
            // must set rc = tempRC on return
            
            func testRCStrategy(prefix: String, type: Brain) {
                if testBrain {
                    display(m2: testM, msg: "\(prefix)Brain: \(type) tempRC: \(tempRC)")
                } // end if
            } // end func testRCStrategy(type: Brain)
            
            func testTempRC(location: String) {
                if testBrain {
                    display(m2: testM, msg: "\(location): tempRC: \(tempRC)")
                } // end if
            } // end func testTempRC(location: String)

            func proposeRandomRC(grd20: Int) {
                testRCStrategy(prefix: R, type: .random)
                repeat {
                    tempRC = [Int.random(in: 1 ... 3), Int.random(in: 1 ... 3)]
                    tempR = tempRC[0]
                    tempC = tempRC[1]
                } while isSquareTaken(grd10: grd20, row10: tempR, col10: tempC)
                testRCStrategy(prefix: L, type: .random)
            } // end func proposeRandomRC(grd20: Int)

            // C H O O S E P R O P O S E R C   C O D E   H E R E
            // returns (continueFlag, proposeFlag)
            // continueFlag: continue = true; quit = false
            // proposeFlag: tempRC is proposed = true; tempRC not proposed = false
            // must set rc = tempRC; r = rc[0], and c = rc[1] on return

            continueFlag = true
            // proposeFlag = false
            testPlayerCurrentStrategy()
            switch playerCurrent.strategy {
            case .random:
                switch count(grd8: tempG, tok8: ex, oh) {
                default:
                    proposeRandomRC(grd20: tempG)
                } // end switch count
            case .smartRandom:
                switch count(grd8: tempG, tok8: ex, oh) {
                case 0, 1:
                proposeRandomRC(grd20: tempG)
                default:
                   proposeRandomRC(grd20: tempG)
                   proposeOorT(grd12: tempG, tok12: playerCurrent.oppToken, grid: false)
                   proposeOorT(grd12: tempG, tok12: playerCurrent.token, grid: false)
                } // end switch count
            case .middle:
                meaningless()
                /*
                switch count(grd8: tempG, tok8: ex, oh) {
                case 0:
                    proposeRandomRC(grd20: tempG)
                    // proposeFreeMiddle(grd20: tempG)

                case 1:
                    proposeRandomRC(grd20: tempG)
                    // proposeCorner(grd20: tempG, row18: 1, col18: 1)
                    // proposeCorner(grd20: tempG, row18: 1, col18: 3)
                    // proposeCorner(grd20: tempG, row18: 3, col18: 1)
                    // proposeCorner(grd20: tempG, row18: 3, col18: 3)
                    // proposeFreeMiddle(grd20: tempG)

                default:
                    proposeRandomRC(grd20: tempG)
                    // proposeCorner(grd20: tempG, row18: 1, col18: 1)
                    // proposeCorner(grd20: tempG, row18: 1, col18: 3)
                    // proposeCorner(grd20: tempG, row18: 3, col18: 1)
                    // proposeCorner(grd20: tempG, row18: 3, col18: 3)
                    // proposeFreeMiddle(grd20: tempG)
                    // proposeOorT(grd12: bigBoard, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                testRCStrategy(type: .middle)
                */
            case .deny:
                meaningless()
                /*
                switch count(grd8: tempG, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomRC(grd20: tempG)
                default:
                    proposeRandomRC(grd20: tempG)
                    // proposeOorT(grd12: bigBoard, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                testRCStrategy(type: .deny)
                */
            case .force:
                meaningless()
                /*
                switch count(grd8: tempG, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomRC(grd20: tempG)
                default:
                    proposeRandomRC(grd20: tempG)
                    // proposeOorT(grd12: bigBoard, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                testRCStrategy(type: .force)
                */
            case .corner:
                meaningless()
                /*
                testRCStrategy(type: .corner)
                switch count(grd8: tempG, tok8: ex, oh) {
                case 0:
                    proposeRandomRC(grd20: tempG)
                // proposeCorner(grd20: tempG, row18: 1, col18: 1)
                case 1:
                    proposeRandomRC(grd20: tempG)
                    /* if isSquareTaken(grd10: tempG, row10: 1, col10: 1) {
                        meaningless()
                        // proposeCorner(grd20: tempG, row18: 3, col18: 3)
                    } else if isSquareTaken(grd10: tempG, row10: 1, col10: 3) {
                        meaningless()
                        // proposeCorner(grd20: tempG, row18: 3, col18: 1)
                    } else if isSquareTaken(grd10: tempG, row10: 3, col10: 3) {
                        meaningless()
                        // proposeCorner(grd20: tempG, row18: 1, col18: 3)
                    } else if isSquareTaken(grd10: tempG, row10: 3, col10: 3) {
                        meaningless()
                        //proposeCorner(grd20: tempG, row18: 1, col18: 1)
                    } // end if */
                default:
                    proposeRandomRC(grd20: g)
                    /* if isSquareTaken(grd10: tempG, row10: 1, col10: 1) {
                         meaningless()
                         // proposeCorner(grd20: tempG, row18: 3, col18: 3)
                     } else if isSquareTaken(grd10: tempG, row10: 1, col10: 3) {
                         meaningless()
                         // proposeCorner(grd20: tempG, row18: 3, col18: 1)
                     } else if isSquareTaken(grd10: tempG, row10: 3, col10: 3) {
                         meaningless()
                         // proposeCorner(grd20: tempG, row18: 1, col18: 3)
                     } else if isSquareTaken(grd10: tempG, row10: 3, col10: 3) {
                         meaningless()
                         // proposeCorner(grd20: tempG, row18: 1, col18: 1)
                     } // end if */
                    // proposeOorT(grd12: tempG, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                testRCStrategy(type: .corner)
                */
            case .keyboard:
                testRCStrategy(prefix: R, type: .keyboard)
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

                    if isSquareTaken(grd10: tempG, row10: tempI1, col10: tempI2) {
                        display(msg: pMsg[7])
                        display(msg: pMsg[8])
                    } // end if

                } while isSquareTaken(grd10: tempG, row10: tempI1, col10: tempI2) // end RCLoop

                tempRC = [tempR, tempC]
                testRCStrategy(prefix: L, type: .keyboard)
            } // end switch strategy
            // tempRC, tempR, tempC proposed here
            return continueFlag
        } // end continueProposeRCorG() -> Bool

        func convertGridToRC(grd22: Int, txt22: String) -> [Int] {
            var tmpRC: [Int] = []
            if grd22 == 1 {
                tmpRC = [1, 1]
            } else if grd22 == 2 {
                tmpRC = [1, 2]
            } else if grd22 == 3 {
                tmpRC = [1, 3]
            } else if grd22 == 4 {
                tmpRC = [2, 1]
            } else if grd22 == 5 {
                tmpRC = [2, 2]
            } else if grd22 == 6 {
                tmpRC = [2, 3]
            } else if grd22 == 7 {
                tmpRC = [3, 1]
            } else if grd22 == 8 {
                tmpRC = [3, 2]
            } else if grd22 == 9 {
                tmpRC = [3, 3]
            } else {
                display(m2: tab2, msg: txt22 + ". Calling grid: \(grd22)")
            } // end if
            return tmpRC
        } // end func convertGridToRC(grd22: Int)

        func markBigBoard(grd17: Int, tok17: String) {
            var tmpRC: [Int] = []
            tmpRC = convertGridToRC(grd22: grd17, txt22: "markBigBoard")
            game[pos(pt1: [bigBoard, tmpRC[0], tmpRC[1]])] = tok17
        } // end func markBigBoard(grd17: Int, tok17: String)

        func clearGrid(grd11: Int, tok11: String) {
            for i in 0 ... 8 {
                game[grd11 * 9 + i] = tok11
            } // end for i
        } // end func clearGrid(grd11: Int, char: String)

        func markTokenInGrid(grd16: Int, tok16: String) {
            // clear Grid
            clearGrid(grd11: grd16, tok11: sp1)
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
                game[grd16 * 9 + 3] = tok16
                game[grd16 * 9 + 5] = tok16
                game[grd16 * 9 + 6] = tok16
                game[grd16 * 9 + 7] = tok16
            } // end if
        } // end func markTokenInGrid(grd16: Int, tok16: String)

        func clearGrids(tok30: String) {
            for x in 1 ... 9 {
                clearGrid(grd11: x, tok11: tok30)
            } // end for
        } // end func clearGrids

        func markGrids() {
            var x: Int
            for y in 1 ... 3 { // for each row in bigBoard
                for z in 1 ... 3 { // for each col in bigBoard
                    x = (y - 1) * 3 + z
                    if game[pos(pt1: [bigBoard, y, z])] == ex { // mark ex
                        // display(m2: testM, msg: "Grid \(x) marked with \(ex)")
                        markTokenInGrid(grd16: x, tok16: ex)
                    } else if game[pos(pt1: [bigBoard, y, z])] == oh { // mark oh
                        // display(m2: testM, msg: "Grid \(x) marked with \(oh)")
                        markTokenInGrid(grd16: x, tok16: oh)
                    } else if game[pos(pt1: [bigBoard, y, z])] == draw { // mark draw
                        // display(m2: testM, msg: "Grid \(x) marked with \(draw)")
                        markTokenInGrid(grd16: x, tok16: draw)
                    } // end if mark tokens
                } // end for z
            } // end for y
        } // end func markGrids()

        func switchPlayers() {
            // print("p = \(player) p1 = \(player1.name), p2 = \(player2.name)")
            func testSwitchPlayers(prefix: String) {
                if testBrain {
                    display(m2: testM, msg: prefix + "\(playerCurrent.name) is current player")
                } // end if
            } // end func switchPlayers
            testSwitchPlayers(prefix: R)
            if playerCurrent.name == player1.name { //Player1 is the current player
                testSwitchPlayers(prefix: R)
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
            testSwitchPlayers(prefix: L)
            nL2()
            display(msg: icnInfo + "\(playerCurrent.name)" + pMsg[18])
            if testBrain {
                // display(msg: testSpc+"Player is \(player). Type is \(type). Token is \(token).")
            } // end if
        } // end func switchPlayers

        func continueDetermineNextGrid() -> Bool {
            // testPoint(location: "\(R)determineNextGrid")
            continueFlag = true
            if testRC {
                display(m2: tab2, msg: "RC: \(rc), R: \(r), C: \(c)")
            }
            tempI1 = (rc[0] - 1) * 3 + rc[1]
            if hasTTTinGrid(grd3: tempI1, tok3: ex) == nil && hasTTTinGrid(grd3: tempI1, tok3: oh) == nil && !isGridDraw(grd15: tempI1) { // no TTT or Draw in this grid: next grid is computed here
                // testPoint(location: "\(R)TTT and Draw assignment")
                tempG = tempI1
                testPoint(location: "\(L)determine: computed")
                nL()
                display(msg: icnWarning + "\(playerCurrent.name)" + pMsg[15] + "\(tempG)!") // must play grid tempG
            } else {
                // next grid is player's choice
                continueFlag = continueProposeGrid()
                if continueFlag {
                    // g = tempG
                    // nL()
                    // display(msg: icnInfo + "\(playerCurrent.name)" + pMsg[16] + "\(tempG)") // you selected grid tempG
                    testPoint(location: "\(L)determine: choice")
                } // end if
            } // end if
            return continueFlag
        } // end func continueDetermineNextGrid

        func testPoint(location: String) {
            if test {
                display(m2: testM, msg: "\(location): G: \(g) R: \(r) C: \(c)")
            } // end if
        } // end func testPoint(location: String)

        // PLAYGAME CODE
        // C O N T I N U E P L A Y   C O D E   H E R E

        againLoop: repeat {
            gameLoop: repeat {
                continueFlag = true
                displayOpeningInfo()
                // if gamesTotal > 1 include stats?
                // openingInfo()

                clearGrids(tok30: under)
                clearGrid(grd11: bigBoard, tok11: under)

                // show the empty board and pauseIt
                displayGame(tag: false)
                if tempS1 == "Q" || tempS1 == "q" {
                    nL2()
                    // display(msg: mMsg[12])
                    continueFlag = false
                    break gameLoop
                } // end if

                // opening grid is choice of first player
                nL()
                display(msg: icnInfo + "\(playerCurrent.name)\(pMsg[18])")
                continueFlag = continueProposeGrid()
                if !continueFlag {
                    break gameLoop
                } // end if

                moveLoop: repeat {
                    // getRC()
                    // tempFlags = chooseProposeRC()
                    continueFlag = continueProposeRC()
                    if !continueFlag {
                        break gameLoop
                    } else {
                        g = tempG
                        rc = tempRC
                        r = rc[0]
                        c = rc[1]
                    } // end if

                    // move
                    game[pos(pt1: [g, r, c])] = playerCurrent.token
                    display(msg: icnInfo + "\(playerCurrent.name)\(pMsg[19])\(playerCurrent.token) in Grid \(g), Row \(r), Column \(c).")

                    // if TTT in Grid
                    if hasTTTinGrid(grd3: g, tok3: playerCurrent.token) != nil {
                        // notify
                        nL()
                        display(msg: icnHand + "\(playerCurrent.name)" + pMsg[9] + "\(g)!")

                        // mark bigBoard
                        markBigBoard(grd17: g, tok17: playerCurrent.token)

                        // mark Token in Grid
                        markTokenInGrid(grd16: g, tok16: playerCurrent.token)

                        // if TTT in Game
                        if hasTTTinGrid(grd3: bigBoard, tok3: playerCurrent.token) != nil {
                            // game is over

                            // notify
                            nL()
                            display(msg: pMsg[10] + "\(playerCurrent.name)," + pMsg[11])

                            // clear grids
                            clearGrids(tok30: sp1)

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

                            break moveLoop
                        } // end if hasTTT in Grid = 0 ie Game

                        // if Draw in Grid
                    } else if isGridDraw(grd15: g) {
                        // notify
                        nL()
                        display(msg: pMsg[12] + "\(g)" + pMsg[13]) // Grid is a draw

                        // mark bigBoard
                        markBigBoard(grd17: g, tok17: draw)

                        // mark Token in Grid
                        markTokenInGrid(grd16: g, tok16: draw)

                        // if Draw in Game
                        if isGridDraw(grd15: bigBoard) {
                            // game is over

                            // notify
                            nL()
                            display(msg: pMsg[14])

                            // clear grids
                            clearGrids(tok30: sp1)

                            // mark boards with TTTs and Draws
                            markGrids()

                            // print it!
                            displayGame(tag: true)

                            // count draw
                            gameCount += 1
                            player1.gamesDrawn += 1
                            player2.gamesDrawn += 1

                            break moveLoop
                        } // end if isDrawInGrid
                    } // end if TTT in Grid

                    displayGame(tag: true)

                    switchPlayers()

                    continueFlag = continueDetermineNextGrid()
                    if !continueFlag {
                        break gameLoop
                    }

                } while continueFlag // end moveLoop ==> check this condition

                nL()
                display(msg: pMsg[17])
                display(m2: tab2, msg: mMsg[13] + mMsg[19]) // Yes
                display(m2: tab2, msg: mMsg[14] + mMsg[20]) // 2) No
                display(msg: mMsg[21] + mMsg[22], trm: "")
                tempS1 = readLine(strippingNewline: true)!
                if tempS1 == "Q" || tempS1 == "q" {
                    nL2()
                    // display(msg: mMsg[12]) //  Elected to quit
                    continueFlag = false
                    // break gameLoop
                } else if tempS1.isInt {
                    tempI1 = Int(tempS1)!
                    if tempI1 == 1 {
                        // notifyToken()
                        break gameLoop
                    } else if tempI1 == 2 {
                        if gameCount >= 1 {
                            nL()
                            displayGameStats()
                        } // end if
                        nL2()
                        // display(msg: mMsg[12]) // Quit message
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
