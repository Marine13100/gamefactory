//
//  File.swift
//  Game Factory
//
//  Created by Marine Bernard on 16/12/2019.
//  Copyright © 2019 Marine Bernard. All rights reserved.
//

import Foundation

final class Elf: Character {

    init(name: String) {
        super.init(name: name, lifepoint: 50, weapon: Bow(), description: "I am the elf")
    }


   
}

