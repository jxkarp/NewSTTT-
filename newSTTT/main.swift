//
//  main.swift
//  newSTTT
//
//  Created by Jack Karp on 7/8/25.
//

import Foundation

// M A I N   T E S T   V A R I A B L E S
var test = false
var testBrain = true
var testBigBoard = false

// M A I N   E X T E N S I O N S
extension String { // needed for testing keyboard input
    // usage:
    // "1".isInt // true
    // "Hello world".isInt // false
    // "".isInt // false
    var isInt: Bool {
        return Int(self) != nil
    } // end var definition
} // end extension

// M A I N   C O N S T A N T S
let testSpcM = "\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
let testBrainM = "\t\t\t\t\t"
let testBigBoardM = "\t\t\t\t"
let tab = "\t"
let tab2 = "\t\t"
let icnHand = "✋ " // U+270B
let icnError = "📕 "
let icnWarning = "📙 "
let icnOK = "📗 "
let icnAction = "📘 "
let icnCanceled = "📓 "
let icnOther = "📔 "
let icnInfo = "ℹ️ "
let icnArrow = "➜ "
let icnExclam = "❗ "
let icnQMark = "❓ "
let sp1 = " "
let sp2 = "  "
let ex = "X"
let oh = "O"
let draw = "D"
let mMsg = [
    "*", // 0, because
    icnHand + "Hi, Jack!", // 1 Hi, Jack
    icnHand + "Bye, Jack!!", // 2 Bye, Jack
    icnHand + "Welcome to Super Tic Tac Toe!", // 3 Welcome
    icnHand + "Thanks for playing Super Tic Tac Toe!", // 4 Thanks
    icnHand + "This match:", // 5 This match
    "v.", // 6 v.
    "Press Return to continue... or Q to quit. ", // 7 Press return
    icnWarning + "The number you entered was ", // 8 out of range
    sp2 + "Please try again.", // 9 Please try again
    icnWarning + "You can't play this grid: it already has a Tic Tac Toe.", // 10 already TTT
    icnWarning + "You cant play this grid: it is already a draw.", // 11 already a draw
    icnInfo + "You elected to quit.", // 12 You elected to quit
] // end mMsg

// M A I N   V A R I A B L E S
var tempS1 = ""
var tempS2 = ""
var tempS3 = ""
var tempI1 = 1
var tempI2 = 1
var mmFlag = false

var gameCount = 0

var continueFlag = false // continue = true; quit = false

// P L A Y E R  S T R U C T
// creates variables name, type, token, gamesWon
var player1 = Player()
var player2 = Player()
var playerCurrent = Player()

// I N I T I A L I Z E G A M E  S T R U C T
var initializeGame = InitializeGame()

// P L A Y G A M E  S T R U C T
var playGame = PlayGame()

// B R A I N   E N U M
enum Brain: String {
    case random = "Random"
    case middle = "Middle"
    case deny = "Deny"
    case force = "Force"
    case corner = "Corner"
    case keyboard = "Keyboard"
} // end enum Brain

// M A I N   F U N C T I O N S
func display(m1: String = "\t\t", m2: String = "", msg: String, trm: String = "\n") { // prints msg with new line
    print(m1 + m2 + "\(msg)", terminator: trm)
} // end func display

func nL() { print("\n") }

func nL2() { print("\n\n") }

func returnToken(tok1: String, flag1: Bool = true) -> String {
    if flag1 {
        return tok1.uppercased()
    } else {
        return tok1.lowercased()
    } // end if
} // end func returnToken(tok1: String, flag1: Bool = true) -> String

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
    if gameCount > 1 {
        displayGameStats()
    } // end if
} // end func displayOpeningInfo()

func errorOutOfRange(upper: Int) {
    tempS1 = "greater than \(upper)."
    if upper < 0 {
        tempS1 = "less than 1."
    }
    display(msg: icnWarning + mMsg[8] + tempS1) // Not in range
    display(msg: sp2 + mMsg[9]) // Try again
} // end errorOutOfRange

func displayGameStats() {
    var temp1 = player1.name
    var temp2 = player2.name

    while temp1.count < 18 {
        temp1 = player1.name + " "
    } // end while
    while temp2.count < 18 {
        temp2 = player2.name + " "
    } // end while
    var gW1 = String(player1.gamesWon)
    var gL1 = String(player1.gamesLost)
    var gT1 = String(player1.gamesDrawn)
    var gW2 = String(player2.gamesWon)
    var gL2 = String(player2.gamesLost)
    var gT2 = String(player2.gamesDrawn)
    var gC = String(gameCount)

    while gW1.count < 8 {
        gW1 = " " + gW1
    } // end while
    while gL1.count < 8 {
        gL1 = " " + gL1
    } // end while
    while gT1.count < 8 {
        gT1 = " " + gT1
    } // end while
    while gW2.count < 8 {
        gW2 = " " + gW2
    } // end while
    while gL2.count < 8 {
        gL2 = " " + gL2
    } // end while
    while gT2.count < 8 {
        gT2 = " " + gT2
    } // end while
    while gC.count < 8 {
        gC = " " + gC
    } // end while

    display(msg: icnHand + "G A M E   S T A T I S T I C S")
    display(msg: "                    Won    Lost   Drawn   Total")
    display(msg: temp1 + gW1 + gL1 + gT1 + gC)
    display(msg: temp2 + gW2 + gL2 + gT2 + gC)
}

// M A I N   T H E   G A M E

// display(m1: "", msg: mMsg[1]) // Hi Jack

display(m2: "", msg: mMsg[3], trm: "") // Welcome
// display(m2: testBigBoardM, msg: "before gameLoop")

continueFlag = true
quitLoop: repeat {
    gameLoop: repeat {
        // display(m2: testBrainM, msg: "inside top gameLoop")

        if !initializeGame.continueInitialize() {
            break gameLoop
        } else if !playGame.continuePlay() {
            break gameLoop
        } // end if

        break gameLoop

    } while true // end gameLoop

    if !continueFlag {
        display(msg: mMsg[12]) // You elected to quit
        break quitLoop
    } else {
        // play again
        // play again code here
        if !continueFlag {
            break quitLoop
        } // end if
    } // end if

} while true // end quitLoop

nL()
display(m2: "", msg: mMsg[4]) // Thanks for playing
// display(m1: "", msg: mMsg[2]) // Bye Jack
