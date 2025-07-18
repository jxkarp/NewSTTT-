//
//  InitializeGame.swift
//  newSTTT
//
//  Created by Jack Karp on 7/9/25.

// I N I T I A L I Z E G A M E   S T R U C T
struct InitializeGame {
    // I N I T I A L I Z E G A M E   C O N S T A N T S
    let human = "human"
    let machine = "machine"
    let iMsg = [
        "*", // 0, because
        "", //
        "", //
        "", //
        "", //
        "", //
        "", //
        icnExclam + "What type of game do you want to play?", // 7
        "human ", // 8 human
        "machine ", // 9 machine
        "v. ", // 10 v.
        icnQMark + "Please enter a number from 1 to 3", // 11 Enter 1-3
        "", // 12
        "", // 13
        "", // 14
        "", // 15
        icnInfo + "You selected ", // 16 You selected
        ", please enter your name: ", // 17 what is your name
        icnExclam + "Do you want to go first, ", // 18 Go first?
        "", // 19
        "", // 20
        icnQMark + "Please enter 1 or 2", // 21 enter 1 or 2
        icnInfo + "Player ", // 22 Player
        icnInfo + "Opponent ", // 23 Opponent
        " is going first.", // 24 goes first
        " is going second.", // 25 goes second
        ", do you want to play O or X?", // 26 O or X
        oh, // 27 O
        ex, // 28 X
        icnExclam + "What strategy do you want ", // 29 Strategy for machine player
        " to play?", // 30 strategy for machine player
        Brain.random.rawValue, // 31 random
        Brain.middle.rawValue, // 32 middle
        Brain.deny.rawValue, // 33 deny
        Brain.force.rawValue, // 34 force
        Brain.corner.rawValue, // 35 corner
        icnQMark + "Please enter a number from 1 to 5", // 36 enter 1 to 5
        "token ", // 37 token
    ] // end iMsg

    // I N I T I A L I Z E G A M E   V A R I A B L E S
    var names = ["Brainiac", "Goliath", "Moo Ping", "Avivo", "Bartleby", "Borgia", "Scrounger", "Sundstrom", "Seck", "Mimi", "Liu", "Josephine"]
    var tempBrain = Brain.random

    // I N I T I A L I Z E G A M E   F U N C T I O N S
    mutating func continueInitialize() -> Bool {
        func continueGameType() -> Bool {
            continueFlag = true
            gameTypeLoop: repeat {
                nL()
                display(msg: iMsg[7]) // What type of game to you want to play?
                display(m2: tab2, msg: mMsg[13] + iMsg[8] + iMsg[10] + iMsg[8]) //  1) human v. human
                display(m2: tab2, msg: mMsg[14] + iMsg[8] + iMsg[10] + iMsg[9]) //  2) human v. machine
                display(m2: tab2, msg: mMsg[15] + iMsg[9] + iMsg[10] + iMsg[9]) //  3) machine v. machine
                display(msg: iMsg[11] + mMsg[22], trm: "") // enter 1..3 or Q
                tempS1 = readLine(strippingNewline: true)!
                if tempS1 == "Q" || tempS1 == "q" {
                    nL2()
                    display(msg: mMsg[12]) //  Elected to quit
                    continueFlag = false
                } else if tempS1.isInt {
                    tempI1 = Int(tempS1)!
                    // break?
                } else {
                    errorOutOfRange(upper: 3)
                } // end if
            } while tempI1 < 1 || tempI1 > 3 // end gameTypeLoop
            return continueFlag
        } // end func continueGameType

        /* func notifyWhoGoesFirst(tag: Bool) {
            nL()
            if tag {
                if player1.goesFirst {
                    // notify
                    display(msg: iMsg[22] + player1.name + iMsg[24]) // player1 first
                    display(msg: iMsg[22] + player2.name + iMsg[25]) // player2 second
                } // end if player1.goFirst
            } else {
                    // notify
                    display(msg: iMsg[23] + player2.name + iMsg[24]) // player2 first
                    display(msg: iMsg[23] + player1.name + iMsg[25]) // player1 second
            } // end if
            
        } // end notifyWhoGoesFirst() */
        
        func notifyWhoGoesFirst() {
            nL()
            if player1.goesFirst {
                // notify
                display(msg: iMsg[22] + player1.name + iMsg[24]) // player1 first
                display(msg: iMsg[23] + player2.name + iMsg[25]) // player2 second
            } else {
                // notify
                display(msg: iMsg[22] + player2.name + iMsg[24]) // player2 first
                display(msg: iMsg[23] + player1.name + iMsg[25]) // player1 second
            } // end if goFirst
        } // end notifyWhoGoesFirst()

        func continueWhoGoesFirst() -> Bool {
            continueFlag = true
            outerWhoFirstLoop: repeat {
                innerWhoFirstLoop: repeat {
                    nL()
                    display(msg: iMsg[18] + player1.name + "?") // Do you want to go first, player1.name?
                    display(m2: tab2, msg: mMsg[13] + mMsg[19]) // 1) Yes
                    display(m2: tab2, msg: mMsg[14] + mMsg[20]) // 2) No
                    display(msg: mMsg[22] + mMsg[22], trm: "") // Please enter 1 or 2
                    tempS1 = readLine(strippingNewline: true)!
                    if tempS1 == "Q" || tempS1 == "q" {
                        display(msg: mMsg[12]) //  Elected to quit
                        continueFlag = false
                        break innerWhoFirstLoop
                    } else if tempS1.isInt {
                        tempI1 = Int(tempS1)!
                        if tempI1 >= 1 && tempI1 <= 2 {
                            if tempI1 == 1 {
                                player1.goesFirst = true
                            } else {
                                player2.goesFirst = true
                            } // end if
                            notifyWhoGoesFirst()
                            break innerWhoFirstLoop
                        } // end if
                    } else {
                        errorOutOfRange(upper: 2)
                    } // end if
                } while !tempS1.isInt // end innerWhoFirstLoop
            } while tempI1 < 1 || tempI1 > 2 // end outerWhoFirstLoop
            return continueFlag
        } // end func continueWhoGoesFirst -> Bool

        func continueToken() -> Bool {
            func notifyToken() {
                nL()
                if tempI1 == 1 { // player1 selects O
                    // notify
                    player2.token = ex
                    player1.token = oh
                    display(msg: iMsg[16] + iMsg[37] + iMsg[27])
                } else { // player1 selects X
                    // notify
                    player1.token = ex
                    player2.token = oh
                    display(msg: iMsg[16] + iMsg[37] + iMsg[28])
                } // end if O or X
            } // end notifyToken()

            // C O N T I N U E T O K E N   C O D E   H E R E
            continueFlag = true
            outerTokenLoop: repeat {
                innerTokenLoop: repeat {
                    nL()
                    display(msg: icnExclam + player1.name + iMsg[26]) // Player1, do you want to play X or O?
                    display(m2: tab2, msg: sp2 + mMsg[13] + iMsg[27]) // 1) O
                    display(m2: tab2, msg: sp2 + mMsg[14] + iMsg[28]) // 2) X
                    display(msg: mMsg[22] + mMsg[22], trm: "") // Please enter 1 or 2
                    tempS1 = readLine(strippingNewline: true)!
                    if tempS1 == "Q" || tempS1 == "q" {
                        nL2()
                        display(msg: mMsg[12]) //  Elected to quit
                        continueFlag = false
                        break innerTokenLoop
                    } else if tempS1.isInt {
                        tempI1 = Int(tempS1)!
                        if tempI1 >= 1 && tempI1 <= 2 {
                            notifyToken()
                            break innerTokenLoop
                        } // end if
                    } else {
                        errorOutOfRange(upper: 2)
                    } // end if
                } while !tempS1.isInt // end innterTokenLoop
            } while tempI1 < 1 || tempI1 > 2 // end outerTokenLoop
            return continueFlag
        } // end func continueToken() -> Bool

        func getHumanPlayer(tag: String) {
            playerCurrent.type = iMsg[8]
            playerCurrent.strategy = .keyboard
            nL()
            display(msg: icnQMark + tag + iMsg[17], trm: "")
            tempS1 = readLine(strippingNewline: true)!
            playerCurrent.name = playerCurrent.type + tempS1
        } // end func getHumanPlayer(tag: String)

        func getMachinePlayer() {
            playerCurrent.type = "machine"
            playerCurrent.strategy = .random
            playerCurrent.name = names.randomElement()!
        } // end func getMachinePlayer()

        func continueMachineStrategy() -> Bool {
            continueFlag = true
            outerStrategyLoop: repeat {
                innerStrategyLoop: repeat {
                    nL()
                    display(msg: iMsg[29] + playerCurrent.name + iMsg[30]) // what strategy
                    display(m2: tab2, msg: mMsg[13] + iMsg[31]) // random
                    display(m2: tab2, msg: mMsg[14] + iMsg[32]) // middle
                    display(m2: tab2, msg: mMsg[15] + iMsg[33]) // deny
                    display(m2: tab2, msg: mMsg[16] + iMsg[34]) // force
                    display(m2: tab2, msg: mMsg[17] + iMsg[35]) // corner
                    display(msg: iMsg[36] + mMsg[22], trm: "") // Please enter 1 to 5

                    tempS1 = readLine(strippingNewline: true)!

                    if tempS1 == "Q" || tempS1 == "q" {
                        nL2()
                        display(msg: mMsg[12]) // Quit message
                        continueFlag = false
                        break innerStrategyLoop
                    } else if tempS1.isInt {
                        tempI1 = Int(tempS1)!
                        if tempI1 >= 1 && tempI1 <= 5 {
                            switch tempI1 {
                            case 1:
                                tempS2 = Brain.random.rawValue
                                playerCurrent.strategy = .random
                            case 2:
                                tempS2 = Brain.middle.rawValue
                                playerCurrent.strategy = .middle
                            case 3:
                                tempS2 = Brain.deny.rawValue
                                playerCurrent.strategy = .deny
                            case 4:
                                tempS2 = Brain.force.rawValue
                                playerCurrent.strategy = .force
                            case 5:
                                tempS2 = Brain.corner.rawValue
                                playerCurrent.strategy = .corner
                            default: tempS2 = "none"
                            } // end switch
                        } else {
                            errorOutOfRange(upper: 5)
                        } // end if
                    } // end if

                } while !tempS1.isInt // end innerStrategyLoop
                return continueFlag
            } while tempI1 < 1 || tempI1 > 5 // end outerStrategyLoop
        } // end func continueMachineStrategy()

        func notifyMachineStrategy(name: String, strat: Brain) {
            display(msg: iMsg[16] + "strategy " + strat.rawValue + " for " + name)
        } // end func strategyNotify

        func assignCurrentPlayer() {
            if player1.goesFirst { // player1 goes first
                playerCurrent.name = player1.name
                playerCurrent.type = player1.type
                playerCurrent.token = player1.token
                playerCurrent.strategy = player1.strategy
                playerCurrent.oppToken = player2.token
                playerCurrent.goesFirst = player1.goesFirst
            } else { // player2 goes first
                playerCurrent.name = player2.name
                playerCurrent.type = player2.type
                playerCurrent.token = player2.token
                playerCurrent.strategy = player2.strategy
                playerCurrent.oppToken = player1.token
                playerCurrent.goesFirst = player2.goesFirst
            } // end if
            if test {
                display(msg: "Name1 = \(player1.name)\n Type = \(player1.type)\n Token = \(player1.token)\n Strategy = \(player1.strategy)\n Opponent Token = \(player1.oppToken)\n Goes First = \(player1.goesFirst)\n\n Name2 = \(player2.name)\n Type = \(player1.type)\n Token = \(player2.token)\n Strategy = \(player2.strategy)\n Opponent Token = \(player2.oppToken)\n Goes First = \(player2.goesFirst)\n\nCurrent Name = \(playerCurrent.name)\n Type = \(playerCurrent.type)\n Token = \(playerCurrent.token)\n Strategy = \(playerCurrent.strategy)\n Opponent Token = \(playerCurrent.oppToken)\n Goes First = \(playerCurrent.goesFirst)")
            } // end if test
        } // end func assignCurrentPlayer

        // C O N T I N U E I N I T I A L I Z E   C O D E  S T A R T S   H E R E
        continueFlag = true
        initLoop: repeat {
            continueFlag = continueGameType()
            if !continueFlag {
                break initLoop
            } // end if !gameTypeLoop

            // HH game
            if tempI1 == 1 { // human/human game
                // notify
                nL()
                display(msg: iMsg[16] + iMsg[8] + iMsg[10] + iMsg[8]) // human/human

                // get human player1
                getHumanPlayer(tag: "Player")
                player1.name = playerCurrent.name
                player1.type = playerCurrent.type
                player1.strategy = .keyboard

                // get human player2
                getHumanPlayer(tag: "Opponent")
                player2.name = playerCurrent.name
                player2.type = playerCurrent.type
                player2.strategy = playerCurrent.strategy

                continueFlag = continueWhoGoesFirst()
                if !continueFlag {
                    break initLoop
                } else {
                    notifyWhoGoesFirst()
                    continueFlag = continueToken()
                    if !continueFlag {
                        break initLoop
                        // } else {
                        // assignCurrentPlayer()
                    } // end if
                } // end if !whoGoesFirst

                // HM game
            } else if tempI1 == 2 { // human/machine game
                // notify
                display(msg: iMsg[16] + iMsg[8] + iMsg[10] + iMsg[9]) // human/machine

                // get human player1
                getHumanPlayer(tag: "Player")
                player1.name = playerCurrent.name
                player1.type = playerCurrent.type
                player1.strategy = .keyboard

                // get machine player
                getMachinePlayer()
                player2.type = playerCurrent.type
                player2.name = player2.type + sp1 + playerCurrent.name
                player2.strategy = playerCurrent.strategy

                // whoGoesFirst
                continueFlag = continueWhoGoesFirst()
                if !continueFlag {
                    notifyWhoGoesFirst()
                    break initLoop
                } else {
                    continueFlag = continueToken()
                    if !continueFlag {
                        break initLoop
                        // } else {
                        // assignCurrentPlayer()
                    } // end if

                    continueFlag = continueMachineStrategy()
                    playerCurrent.name = player2.name
                    if !continueFlag {
                        // continueFlag = false
                        break initLoop
                    } else {
                        player2.strategy = playerCurrent.strategy
                        notifyMachineStrategy(name: player2.name, strat: player2.strategy)
                    } // end if !continueMachineStrategy
                } // end if whoGoesFirst

                // MM game
            } else if tempI1 == 3 { // machine/machine game
                mmFlag = true
                // notify
                display(msg: iMsg[16] + iMsg[9] + iMsg[10] + iMsg[9]) // machine/machine

                // get player1 name, type, token
                getMachinePlayer()
                player1.name = playerCurrent.name
                player1.type = playerCurrent.type
                // player1.strategy = playerCurrent.strategy
                player1.token = oh

                tempI1 = names.firstIndex(of: player1.name)!
                names.remove(at: tempI1)
                player1.name = playerCurrent.type + sp1 + playerCurrent.name

                // get player2 name, type, token
                getMachinePlayer()
                player2.name = playerCurrent.type + sp1 + playerCurrent.name
                player2.type = playerCurrent.type
                // player2.strategy = playerCurrent.strategy
                player2.token = ex

                // continueWhoGoesFirst
                player1.goesFirst = true
                notifyWhoGoesFirst()

                // continueMachineStrategy player1
                playerCurrent.name = player1.name
                continueFlag = continueMachineStrategy()
                if !continueFlag {
                    // continueFlag = false
                    break initLoop
                } else {
                    player1.strategy = playerCurrent.strategy
                    notifyMachineStrategy(name: player1.name, strat: player1.strategy)
                } // end if !continueMachineStrategy

                // continueMachineStrategy player2
                playerCurrent.name = player2.name
                continueFlag = continueMachineStrategy()
                if !continueFlag {
                    // continueFlag = false
                    break initLoop
                } else {
                    player2.strategy = playerCurrent.strategy
                    notifyMachineStrategy(name: player2.name, strat: player2.strategy)
                } // end if !continueMacineStrategy
            } // end if
            // continueFlag = true
            assignCurrentPlayer()
            break initLoop
        } while true // end repeat initLoop
        return continueFlag
    } // end func continueInitialize
} // end struct InitializeGame
