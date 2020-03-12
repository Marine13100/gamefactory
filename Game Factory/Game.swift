//
//  Game.swift
//  Game Factory
//
//  Created by Marine Bernard on 20/12/2019.
//  Copyright © 2019 Marine Bernard. All rights reserved.
//

import Foundation

final class Game {
    
    // MARK: - PROPERTIES
    
    private var teams: [Team] = []
    private var turn : Int = 0
    
    // MARK: - METHODS
    
    /// Allows to start the game
    func start() {
        print("========================")
        print("Welcome to the Game")
        print("========================")
        createTeams()
        battle()
        printDetailOfTheGame()
        
        
    }
    
    /// Function that creates two teams
    private func createTeams() {
        for i in 0..<2 {
            print ("")
            print ("========================")
            print ("Player \(i + 1)")
            let team = Team()
            teams.append(team)
            
        }
        
    }
    private func battle() {
        while true {
            turn += 1
            for i in 0..<2 {
                teams[i].description()
                print ("select your character")
                
                
                let character = teams[i].characters[userChoise() - 1]
                randomChest(character: character)
                print ("")
                print ("================================")
                print ("What action do you want to do ?")
                print ("choose 1 to attack a character, or choose 2 to heal you")
                var selectAnAction = 0
                repeat{
                    if let data = readLine() {
                        if let dataToInt = Int(data) {
                            selectAnAction = dataToInt
                        }
                    }
                } while selectAnAction != 1 && selectAnAction != 2
                
                
                if selectAnAction == 1 {
                    if i == 0 {
                        
                        fightStatement(character: character, index: i)
                        if teams[i + 1].isDead() {
                            return
                        }
                    } else {
                        
                        fightStatement(character: character, index: i)
                        if teams[i - 1].isDead() {
                            return
                        }
                    }
                    
                } else {
                    
                    print("choose your character to heal")
                    teams[i].description()
                    
                    character.heal(target: teams[i].characters[userChoise() - 1])
                    
                }
                
                
            }
            
        }
    }
    /// Function that allows you to  create a chest containing an overpowered weapon that appears randomly.
    private func randomChest(character: Character) {
        let randomChest = Int.random(in: 0...50)
        if randomChest <= 20 {
            print ("***************************************")
            print ("Great! a chest appears in front of you.")
            print ("***************************************")
            character.weapon = MagicSword()
            print ("\(character.name) take is the Magic Sword")
            
        }
        
    }
    private func printDetailOfTheGame () {
        print("")
        print ("=============================")
        print ("game statistics")
        print ("=============================")
        print("")
        for (index, team) in teams.enumerated() {
            if !team.isDead() {
                print("team n°\(index + 1) wins")
            }
            
        }
        print (" the game is finished in \(turn) turns")
        print("==================================")
    }
    
    private func userChoise() -> Int {
        var userChoise = 0
        repeat{
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoise = dataToInt
                }
            }
        } while userChoise != 1 && userChoise != 2 && userChoise != 3
        return userChoise
    }
    private func fightStatement(character: Character, index: Int) {
        print("choose your character to attack")
        if index == 0 {
            teams[index + 1].description()
            
            character.attack(target: teams[index + 1].characters[userChoise() - 1])
        }else{
            teams[index - 1].description()
            
            character.attack(target: teams[index - 1].characters[userChoise() - 1])
        }
        
    }
}


