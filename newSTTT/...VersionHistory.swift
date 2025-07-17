//
//  .VersionHistory.swift
//  newSTTT
//
//  Created by Jack Karp on 7/8/25.
//
/*
    Version Date    Comments
 
    *       250717  Conversion to GitHub

    12              Check need for tag in displayGame
                    May need to reset tempI1 or make it a private variable so break xxxLoop will execute properly! Or change over to returned tuples that include tempI1
 
    11      250715  √ Change isTTTinGrid to hasTTTinGrid
                    √ Rework isGridTTT to consider only count, not cound and TTT
                    √ Rework OorT for multiple parameters
 
    10      250715  √ Reinstate proposeGrid
                    √ Remove proposeFlag, tempFlags
                    √ Fix if game is MM, eliminate return on game display
 
    9       250714  Convert proposeRC to proposeRCorG
                    Eliminate proposeGrid
 
    8       250714  NamingConventions
                    √ Fix chooseMachineStrategy; add Bool return
                    √ Fix chooseMachineStrategy; change to continueMachineStrategy
                    √ Fix play; change to choosePlay and add Bool return
                    √ Fix initialize; change to chooseInitialize and add Bool return
                    √ Fix squareIsTaken; change to isSquareTaken
                    √ Fix isDraw; change to isGridDraw
                    √ Fix proposeRC; change to chooseProposeRC
                    √ Fix proposeGrid; change to chooseProposeGrid
                    √ Fix change all choose to continue
                    √ Fix isTTT; change to isGridTTT
 
    7       250713  From v. 5
                    Initialization dialogs
                    Player.goesFirst, eliminate goFirst

    6       250713  Houston, we have a problem

    5       250713  Check strategies alignment
                    Check token assignment
                    Check all 3 game types

    4       250712  Version without Brain, PrintGame, TempStuff
                    Maybe kill proposeFlag??

    3       250711  PrintGame
                    GetGrid
                    GetRC
                    Last version with Brain, PrintIt, TempStuff

    2       250710  Initialization dialogues

    1       250709  Playing around with loops and functions
                    Building InitializeGame

    1       250708  New version started

 */
