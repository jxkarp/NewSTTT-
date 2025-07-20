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

    // P L A Y G A M E   F U N C T I O N S
    mutating func continuePlay() -> Bool {
        func pos(pt1: [Int]) -> Int { // pos returns the index to the array game
            return pt1[0] * 9 + (pt1[1] - 1) * 3 + pt1[2] - 1
        } // end func pos(pt1: [Int]) -> Int
        
        func hasTTTinGrid(grd3: Int, tok3: String...) -> Int? {
            // if return == 0 there is no TTT, else the number that corresponds to which TTT (eg: row1, col3, LtoR diag, etc.)
            var tttGrid: Int?
            // tempI1 = 0
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
                    if (hasTTTinGrid(grd3: grd6, tok3: ex, oh) != nil) || isGridDraw(grd15: grd6) {
                        return sp7
                    } else { // is big grid TTT
                        return "Grid" + sp1 + String(grd6) + sp1
                    } // end if
                } // end func printGridLabel
                
                // F O R M L A B E L L I N E   C O D E   H E R E
                if hasTTTinGrid(grd3: bigBoard, tok3: ex, oh) != nil {
                    return ""
                } else {
                    return "\(tab2)\(sp6)\(printGridLabel(grd6: grd14))\(sp1)\(bar)\(sp3)\(printGridLabel(grd6: grd14 + 1))\(sp1)\(bar)\(sp3)\(printGridLabel(grd6: grd14 + 2))\n"
                } // end if
            } // end func formLabelLine
            
            func printSpacers() -> String {
                if hasTTTinGrid(grd3: bigBoard, tok3: ex, oh) != nil || isGridDraw(grd15: bigBoard) {
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
        
        func meaningless() {
            print("meaningless")
        } // end func meaningless
        
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
                tempR = tempRC[0]
                tempC = tempRC[1]
            } while isSquareTaken(grd10: grd20, row10: tempR, col10: tempC)
            
            // proposeTempG(grd21: grd20)
        } // end func takeRandomRC
                
        func continueProposeRCorG() -> Bool {
            // returns continueFlag
            // must set rc = tempRC on return
            
            // C H O O S E P R O P O S E R C   C O D E   H E R E
            // returns (continueFlag, proposeFlag)
            // continueFlag: continue = true; quit = false
            // proposeFlag: tempRC is proposed = true; tempRC not proposed = false
            // must set rc = tempRC on return
            
            func testStrategy(type: Brain) {
                if test {
                    display(m2: testM, msg: "\(Brain.self) strategy.")
                } // end if
            } // end func testStrategy(type: Brain)
            
            continueFlag = true
            // proposeFlag = false
            if test {
                display(m2: testM, msg: "Current player's strategy = \(playerCurrent.strategy)")
            } // end if
            switch playerCurrent.strategy {
            case .random:
                testStrategy(type: .random)
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomRC(grd20: g)
                default:
                    proposeRandomRC(grd20: g)
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .middle:
                testStrategy(type: .middle)
                switch count(grd8: g, tok8: ex, oh) {
                case 0:
                    proposeRandomRC(grd20: g)
                    // proposeFreeMiddle(grd20: g)
                    
                case 1:
                    proposeRandomRC(grd20: g)
                    // proposeCorner(grd20: g, row18: 1, col18: 1)
                    // proposeCorner(grd20: g, row18: 1, col18: 3)
                    // proposeCorner(grd20: g, row18: 3, col18: 1)
                    // proposeCorner(grd20: g, row18: 3, col18: 3)
                    // proposeFreeMiddle(grd20: g)
                    
                default:
                    proposeRandomRC(grd20: g)
                    // proposeCorner(grd20: g, row18: 1, col18: 1)
                    // proposeCorner(grd20: g, row18: 1, col18: 3)
                    // proposeCorner(grd20: g, row18: 3, col18: 1)
                    // proposeCorner(grd20: g, row18: 3, col18: 3)
                    // proposeFreeMiddle(grd20: g)
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .deny:
                testStrategy(type: .deny)
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomRC(grd20: g)
                default:
                    proposeRandomRC(grd20: g)
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .force:
                testStrategy(type: .force)
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomRC(grd20: g)
                default:
                    proposeRandomRC(grd20: g)
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .corner:
                testStrategy(type: .corner)
                switch count(grd8: g, tok8: ex, oh) {
                case 0:
                    proposeRandomRC(grd20: g)
                    // proposeCorner(grd20: g, row18: 1, col18: 1)
                case 1:
                    proposeRandomRC(grd20: g)
                    /* if isSquareTaken(grd10: g, row10: 1, col10: 1) {
                        meaningless()
                        // proposeCorner(grd20: g, row18: 3, col18: 3)
                    } else if isSquareTaken(grd10: g, row10: 1, col10: 3) {
                        meaningless()
                        // proposeCorner(grd20: g, row18: 3, col18: 1)
                    } else if isSquareTaken(grd10: g, row10: 3, col10: 3) {
                        meaningless()
                        // proposeCorner(grd20: g, row18: 1, col18: 3)
                    } else if isSquareTaken(grd10: g, row10: 3, col10: 3) {
                        meaningless()
                        //proposeCorner(grd20: g, row18: 1, col18: 1)
                    } // end if */
                    
                default:
                    
                    proposeRandomRC(grd20: g)
                    /* if isSquareTaken(grd10: g, row10: 1, col10: 1) {
                        meaningless()
                        // proposeCorner(grd20: g, row18: 3, col18: 3)
                    } else if isSquareTaken(grd10: g, row10: 1, col10: 3) {
                        meaningless()
                        // proposeCorner(grd20: g, row18: 3, col18: 1)
                    } else if isSquareTaken(grd10: g, row10: 3, col10: 3) {
                        meaningless()
                        // proposeCorner(grd20: g, row18: 1, col18: 3)
                    } else if isSquareTaken(grd10: g, row10: 3, col10: 3) {
                        meaningless()
                        // proposeCorner(grd20: g, row18: 1, col18: 1)
                    } // end if */
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .keyboard:
                testStrategy(type: .keyboard)
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
            // proposeTempG(grd21: g)
            return continueFlag
        } // end continueProposeRCorG() -> Bool
        
        func continueProposeGrid() -> Bool {
            // returns (continueFlag, proposeFlag)
            // must set g = tempG on return
            
            func testTempG(location: String) {
                if test {
                    display(m2: testM, msg: "\(location): tempG = \(tempG)")
                } // end if
            } // end func testTempG(location: String)
            
            func proposeRandomGrid() {
                testTempG(location: "Before proposeRandomGrid()")
                repeat {
                    tempG = Int.random(in: 1 ... 9)
                } while hasTTTinGrid(grd3: tempG, tok3: ex, oh) != nil || isGridDraw(grd15: tempG)
                testTempG(location: "After proposeRandomGrid()")
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
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .middle:
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .deny:
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
                } // end switch count
                
            case .force:
                
                switch count(grd8: g, tok8: ex, oh) {
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
            case .corner:
                
                switch count(grd8: g, tok8: ex, oh) {
                case 0, 1:
                    proposeRandomGrid()
                default:
                    proposeRandomGrid()
                    // proposeOorT(grd12: 0, tok12: playerCurrent.oppToken, playerCurrent.token)
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
                } while hasTTTinGrid(grd3: tempG, tok3: ex, oh) != nil || count(grd8: tempG, tok8: ex, oh) == 9 // end outerGridLoop
            } // end switch strategy
            return continueFlag
        } // end  func chooseProposeGrid() -> (continueFlag, proposeFlag)
        
        func convertGridToRC(grd22: Int) -> [Int] {
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
            } // end if
            return tmpRC
        } // end func convertGridToRC(grd22: Int)
        
        func markBigBoard(grd17: Int, tok17: String) {
            var tmpRC: [Int] = []
            tmpRC = convertGridToRC(grd22: grd17)
            game[pos(pt1: [bigBoard, tmpRC[0], tmpRC[1]])] = tok17
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
                game[grd16 * 9 + 3] = tok16
                game[grd16 * 9 + 5] = tok16
                game[grd16 * 9 + 6] = tok16
                game[grd16 * 9 + 7] = tok16
            } // end if
        } // end func markTokenInGrid(grd16: Int, tok16: String)
        
        func clearGrids() {
            for x in 1 ... 9 {
                clearGrid(grd11: x)
            } // end for
        } // end func clearGrids
        
        func markGrids() {
            var x: Int
                for y in 1 ... 3 { // for each row in bigBoard
                    for z in 1 ... 3 { // for each col in bigBoard
                        x = (y-1)*3 + z
                        if game[pos(pt1: [bigBoard, y, z])] == ex { // mark ex
                            display(m2: testM, msg: "Grid \(x) marked with \(ex)")
                            markTokenInGrid(grd16: x, tok16: ex)
                        } else if game[pos(pt1: [bigBoard, y, z])] == oh { // mark oh
                            display(m2: testM, msg: "Grid \(x) marked with \(oh)")
                            markTokenInGrid(grd16: x, tok16: oh)
                        } else if game[pos(pt1: [bigBoard, y, z])] == draw { // mark draw
                            display(m2: testM, msg: "Grid \(x) marked with \(draw)")
                            markTokenInGrid(grd16: x, tok16: draw)
                        } // end if mark tokens
                    } // end for z
                } // end for y

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
            display(msg: icnInfo+"\(playerCurrent.name)"+pMsg[18])
            if testBrain {
                // display(msg: testSpc+"Player is \(player). Type is \(type). Token is \(token).")
            } // end if
        } // end func switchPlayers
        
        func continueDetermineNextGrid() -> Bool {
            testPoint(location: "Start: determineNextGrid")
            continueFlag = true
            tempI1 = (r-1)*3 + c
            if hasTTTinGrid(grd3: tempI1, tok3: ex, oh) == nil && !isGridDraw(grd15: tempI1) { // no TTT or Draw in this grid: next grid is computed here
                testPoint(location: "Before TTT and Draw assignment")
                g = tempI1
                testPoint(location: "After TTT and Draw assignment")
                nL()
                display(msg: icnWarning + "\(playerCurrent.name)"+pMsg[15]+"\(g)!")
            } else {
                // next grid is player's choice
                continueFlag = continueProposeGrid()
                if continueFlag {
                    g = tempG
                    nL()
                    display(msg: icnInfo + "\(playerCurrent.name)"+pMsg[16]+"\(g)")
                 } // end if
            } // end if
            testPoint(location: "After determine")
            return continueFlag
        } // end func continueDetermineNextGrid
        
        func testPoint(location: String) {
            if test {
                display(m2: testM, msg: "\(location): G = \(g) R = \(r) C = \(c)")
            } // end if
        } // end func testPoint(location: String)
        
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
                    // display(msg: mMsg[12])
                    continueFlag = false
                    break gameLoop
                } // end if
                
                // opening grid is choice of first player
                nL()
                display(msg: icnInfo+"\(playerCurrent.name)\(pMsg[18])")
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
                    display(msg: icnInfo+"\(playerCurrent.name)\(pMsg[19])\(playerCurrent.token) in Grid \(g), Row \(r), Column \(c).")
                    
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
                            
                            break moveLoop
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
                display(m2: tab2, msg: mMsg[13]+mMsg[19]) // Yes
                display(m2: tab2, msg: mMsg[14] + mMsg[20]) // 2) No
                display(msg: mMsg[21]+mMsg[22], trm: "")
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
