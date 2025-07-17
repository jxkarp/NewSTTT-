//
//  Player.swift
//  SuperTicTacToe
//
//  250615 Created by Jack Karp
//

struct Player {
    var name = "Bogus"
    var token = "Q"
    var oppToken = "V"
    var type = "machine"
    var strategy: Brain = .random
    var gamesWon = 0
    var gamesLost = 0
    var gamesDrawn = 0
    var goesFirst = false
} // end struct Player
