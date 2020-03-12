//
//  Characters.swift
//  Game Factory
//
//  Created by Marine Bernard on 16/12/2019.
//  Copyright © 2019 Marine Bernard. All rights reserved.
//

import Foundation

class Character {
    
    // MARK: - PROPERTIES
    
    let name : String
    private var lifepoint : Int
    var weapon : Weapon
    private let description: String
    private let healingPotion = 15
    var isDead: Bool {
        return lifepoint <= 0
    }
    
    // MARK: - INITIALIZER
    
    init(name : String, lifepoint : Int, weapon: Weapon, description: String) {
        self.name = name
        self.lifepoint = lifepoint
        self.weapon = weapon
        self.description = description
    }
    
    // MARK: - METHODS
    
    func toDescribeYourself(index: Int) {
        print("\(index). " + name, " - life points: \(lifepoint) - damages: \(weapon.damages) - " + description)
    }
    
    /// Function to attack characters.
    func attack(target:Character) {
        if lifepoint > 0 && target.lifepoint > 0 {
            target.lifepoint -= weapon.damages
            if target.lifepoint < 0 {
                target.lifepoint = 0
            }
            print("\(name) hits \(target.name) and deal \(weapon.damages) damages")
        }else{
            print ("i can't attack this character")
        }
    }
    /// Function to heal characters.
    func heal(target:Character) {
        if lifepoint > 0 && target.lifepoint > 0 {
            target.lifepoint += healingPotion
            
            print ("\(name) heal \(target.name) to \(weapon.damages) life points")
            
        }else{
            print ("i can't heal this character")
        }
        
    }
    
}
