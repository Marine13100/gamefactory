//
//  Team.swift
//  Game Factory
//
//  Created by Marine Bernard on 20/12/2019.
//  Copyright © 2019 Marine Bernard. All rights reserved.
//

import Foundation



final class Team {
    
    // MARK: - PROPERTIES
    
    var characters: [Character] = []
    static var uniqueCharacterNames : [String] = []
    
    
    // MARK: - INITIALIZER
    
    init() {
        createCharacters()
        
    }
    
    // MARK: - METHODS
    
    func description() {
        
        print("")
        print("Team list:")
        for (index,character) in characters.enumerated() {
            character.toDescribeYourself(index: index + 1)
        }
    }
    
    /// Function that checks if the character is still alive or if he is dead.
    func isDead() -> Bool {
        var isDead = false
        for character in characters {
            if character.isDead {
                isDead = true
                
            }else{
                return false
            }
        }
        return isDead
        
    }
    
    /// Function which the characters.
    private func createCharacter() -> Character? {
        var userChoice = 0
        /// Print of list the characters.
        print("")
        print("===================================================")
        print("1. Elf 50 lifePoint - Bow - Damage: 15")
        print("2. Dwarf 50 lifePoint - Dagger - Damage: 12")
        print("3. Magician 50 lifePoint - Scepter - Damage: 12")
        print("4. Barbarous 50 lifePoint - Axe - Damage: 15")
        print("5. Troll 50 lifePoint - Hammer - Damage: 15")
        print("===================================================")
        
        repeat{
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoice = dataToInt
                    /// Allows you to choose the character to create.
                }
            }
        } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4 && userChoice != 5
        switch userChoice {
        case 1:
            return Elf(name: uniqueCharacterName())
        case 2:
            return Dwarf(name: uniqueCharacterName())
        case 3:
            return Magician(name: uniqueCharacterName())
        case 4:
            return Barbarous(name: uniqueCharacterName())
        case 5:
            return Troll(name: uniqueCharacterName())
        default:
            print ("the character could not be created because its name and already used")
            return nil
            
        }
    }
    /// Function which gives a unique name to each of the characters.
    private func uniqueCharacterName() -> String {
        var name = ""
        repeat {
            print ("Choose the name of the character")
            if let data: String = readLine() {
                name = data
                if Team.uniqueCharacterNames.contains(name){
                    print("")
                    print("The name is already in use")
                    name = ""
                } else {
                    Team.uniqueCharacterNames.append(name)
                }
            }
        }while name == ""
        return name
    }
    
    /// Function that allows you to create three characters and add them to the class board at the top.
    private func createCharacters() {
        for _ in 0..<3 {
            guard let character = createCharacter() else { return  }
            characters.append(character)
        }
        
    }
    
    /// Function that creates the team.
    private func createTeam() -> Team{
        let team = Team()
        print ("=============================")
        print ("")
        print ("you must choose 3 character")
        return team
    }
    
}

