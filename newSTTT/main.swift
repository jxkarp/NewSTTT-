//
//  main.swift
//  newSTTT
//
//  Created by Jack Karp on 7/8/25.
//

import Foundation

// MAIN Test Variables, Extensions, Constants, Variables
// M A I N   T E S T   V A R I A B L E S
var test = false
var testBrain = false
var testBigBoard = false
var testOT = false
var testRC = false

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
let testM = "\t\t\t\t\t\t\t\t\t\t"
let testBrainM = "\t\t\t\t\t"
let testBigBoardM = "\t\t\t\t"
let testOTM = "\t\t\t\t\t\t\t\t\t\t  "
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
let R = "→ "
let L = "← "
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
    "1) ", // 13)
    "2) ", // 14)
    "3) ", // 15)
    "4) ", // 16)
    "5) ", // 17)
    "6) ", // 18)
    "Yes", // 19 Yes
    "No", // 20 No
    icnQMark + "Please enter 1 or 2", // 21 enter 1 or 2
    ", or Q to quit: ", // 22 or Q to quit:

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

// MAIN STRUCTS Player, InitializeGame, PlayGame, Brain Enum
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
    case smartRandomO = "Smart Random Opportunity"
    case smartRandomT = "Smart Random Threat"
    case middle = "Middle"
    case deny = "Deny"
    case force = "Force"
    case corner = "Corner"
    case keyboard = "Keyboard"
} // end enum Brain

// MAIN FUNCTIONS
// M A I N   F U N C T I O N S
func display(m1: String = "\t\t", m2: String = "", msg: String, trm: String = "\n") { // prints msg with new line
    print(m1 + m2 + "\(msg)", terminator: trm)
} // end func display

func nL() { print("\n") }

func nL2() { print("\n\n") }

// currently unused
func returnToken(tok1: String, flag1: Bool = true) -> String {
    if flag1 {
        return tok1.uppercased()
    } else {
        return tok1.lowercased()
    } // end if
} // end func returnToken(tok1: String, flag1: Bool = true) -> String

func errorOutOfRange(upper: Int) {
    tempS1 = "greater than \(upper)."
    if upper < 0 {
        tempS1 = "less than 1."
    }
    display(msg: mMsg[8] + tempS1) // Not in range
    display(msg: sp2 + mMsg[9]) // Try again
} // end errorOutOfRange

// MAIN CODE

// display(m1: "", msg: mMsg[1]) // Hi Jack

display(m2: "", msg: mMsg[3], trm: "") // Welcome
// display(m2: testBigBoardM, msg: "before gameLoop")

continueFlag = true

if !initializeGame.continueInitialize() || !playGame.continuePlay() {
    nL2()
    display(msg: mMsg[12])
} // end if
/* // quitLoop: repeat {
     mainLoop: repeat {
        // display(m2: testBrainM, msg: "inside top gameLoop")

        if !initializeGame.continueInitialize() {
            break mainLoop
        } else if !playGame.continuePlay() {
            break mainLoop
        } // end if

       //  break mainLoop

    } while true // end mainLoop

    /* if !continueFlag {
        display(msg: mMsg[12]) // You elected to quit
        break quitLoop
    } else {
        // play again
        // play again code here
        if !continueFlag {
            break quitLoop
        } // end if
    } // end if
     */
    
// } while true // end quitLoop
*/
nL()
display(m2: "", msg: mMsg[4]) // Thanks for playing
// display(m1: "", msg: mMsg[2]) // Bye Jack
