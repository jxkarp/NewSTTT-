//
//  ..FunctionList.swift
//  newSTTT
//
//  Created by Jack Karp on 7/9/25.
//
/*

 main
     test variables
         test
         testBrain
         testBigBoard
         testOT
     extension
         var isInt
     let
         testM
         testBrainM **?
         testBigBoardM **?
         tab
         tab2
         icnHand
         icnError
         icnWarning
         icnOK
         icnAction
         icnCanceled
         icnOther
         icnInfo
         icnArrow
         icnExclam
         icnQMark
         sp1
         sp2
         ex
         oh
         draw
         mMsg
     var
         tempS1
         tempS2
         tempS3
         tempI1
         tempI2
         mmflag
         continueFlag
         player1 -> struct Player
         player2 -> struct Player
         playerCurrent -> struct Player
         initializeGame -> struct InitializeGame
         playGame -> struct PlayGame
     struct
         Player
         InitializeGame
         PlayGame
     enum
         Brain
             random
             smartRandom
             middle
             deny
             force
             corner
             keyboard
     func
         display(m1: String = "\t\t",m2: String = "",msg:String, trm: String = "\n")
         nL()
         nL2()
         returnToken(tok1: String, flag1: Bool = true) -> String **?
         errorOutOfRange(upper: Int)

  Struct Player
     var
         name
         token
         oppToken
         type
         strategy
         gamesWon
         gamesLost
         gamesDrawn
         goesFirst

 Struct InitializeGame
     let
         human
         machine
         iMsg
     var
         names
         tempBrain **?
     func
         continueInitialize() -> Bool // continue = true; quit = false
             continueGameType() -> Bool // continue = true; quit = false
             notifyWhoGoesFirst()
             continueWhoGoesFirst() -> Bool // continue = true; quit = false
             continueToken() -> Bool // continue = true; quit = false
                 notifyToken()
             getHumanPlayer(tag: String)
             getMachinePlayer()
             continueMachineStrategy(playr: Int) -> Bool // continue = true; quit = false
             notifyMachineStrategy(name: String, strat: Brain)
             assignCurrentPlayer()
             testPlayerInfo(location: String)
 
  Struct PlayGame
     let
         under
         sp6
         sp7
         bigBoard
         tttAs
         pMsg
     var
         game
         g
         r
         c
         rc
         pt
         tempG
         tempR **?
         tempC **?
         tempRC
         tempB **?
         proposeFlag
     func
        continuePlay() -> Bool // continue = true; quit = false
            pos(pt1: [Int]) -> Int
            displayGameStats()
            displayOpeningInfo()
            hasTTTinGrid(grd3: Int, tok3: String...) -> Int?
                var tttGrid
            count(grd8: Int, tok8: String...) -> Int
                var c
            isGridDraw(grd15: Int) -> Bool // draw = true; no draw = false
            displayBigBoard()
            displayGame()
                let
                    horiz
                    bar
                    sp3
                    sp4
                    sp10
                    sp11
                func
                    formLabelLine(grd14: Int) -> String
                        printGridLabel(grd6: Int) -> String
                    printSpacers()
            meaningless()
            isSquareTaken(grd10: Int, row10: Int, col10: Int) -> Bool // square is taken = true; square is not taken = false
            proposeOorT(grd12: Int, tok12: String)
                testOTG(prefix: String)
                testOTRC(prefix: String
            continueProposeGrid() -> Bool
                testGridStrategy(prefix: String, type: Brain)
                testTempG(location: String)
                proposeRandomGrid()
            continueProposeRC() -> Bool // continue = true; quit = false
                testRCStrategy(type: Brain)
                testTempRC(location: String)
                proposeRandomRC(grd20: Int)
            convertGridToRC(grd22: Int) -> [Int] {
            markBigBoard(grd17: Int, tok17: String)
            clearGrid(grd11: Int, tok11: String)
            markTokenInGrid(grd16: Int, tok16: String)
            clearGrids(tok30: String)
            markGrids()
            switchPlayers()
            continueDetermineNextGrid() -> Bool
            testPoint(location: String)

 
 Hold
            proposeFreeMiddle(grd20: Int) **Move
            proposeCorner(grd20: Int, row18: Int, col18: Int) **Move
            proposeAdjacentCorner(grd20: Int) **Move
 
  */
