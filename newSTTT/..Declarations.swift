//
//  ..FunctionList.swift
//  newSTTT
//
//  Created by Jack Karp on 7/9/25.
//
/*

 main
     extension
         var isInt
     let
         testSpcM
         testBrainM
         testBigBoardM
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
         player
         type
         token
         oppToken
         strategy
         totalGames
         flag
         goFirst
         player1 -> struct Player
         player2 -> struct Player
         initializeGame -> struct InitializeGame
         playGame -> struct PlayGame
     struct
         Player
         InitializeGame
         PlayGame
     enum
         Brain
             keyboard
             middle
             deny
             force
             random
             corner
     func
         display(m1: String = "\t\t",m2: String = "",msg:String, trm: String = "\n")
         nL()
         nL2()
         returnToken(tok1: String, flag1: Bool = true) -> String
         errorOutOfRange(upper: Int)

  Struct Player
     var
         name
         token
         type
         strategy
         gamesWon
         gamesLost
         gamesDrawn

 Struct InitializeGame
     let
         human
         machine
         iMsg
     var
         names
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
         pt
         tempG
         ?tempR
         ?tempC
         tempRC
     func
    continuePlay() -> Bool // continue = true; quit = false
        pos(pt1: [Int]) -> Int
        displayGameStats()
        displayOpeningInfo()
        hasTTTinGrid(grd3: Int, tok3: String...) -> Int?
        count(grd8: Int, tok8: String...) -> Int
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
        proposeOorT(grd12: Int, tok12: String) //
        proposeTempG(grd21: Int)
        isSquareTaken(grd10: Int, row10: Int, col10: Int) -> Bool // square is taken = true; square is not taken = false
        proposeRandomRC(grd20: Int)
        proposeFreeMiddle(grd20: Int)
        proposeCorner(grd20: Int, row18: Int, col18: Int)
        proposeAdjacentCorner(grd20: Int)
        continueProposeRC() -> Bool // continue = true; quit = false
            testStrategy(type: Brain)
        continueProposeGrid() -> Bool
            proposeRandomGrid()
        convertGridToRC(grd22: Int) -> [Int] {
        markBigBoard(grd17: Int, tok17: String)
        clearGrid(grd11: Int, tok11: String)
        markTokenInGrid(grd16: Int, tok16: String)
        clearGrids(tok30: String)
        markGrids()
        switchPlayers()
        continueDetermineNextGrid() -> Bool
        testPoint(location: String)
  */
