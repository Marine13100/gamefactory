//
//  Weapon.swift
//  Game Factory
//
//  Created by Marine Bernard on 17/12/2019.
//  Copyright © 2019 Marine Bernard. All rights reserved.
//

import Foundation

class Weapon {
    let damages: Int
    
    init(damages:Int){
        self.damages = damages
    }

}

final class Scepter: Weapon {
    init() {
        super.init(damages: 12)
    }
}
final class Dagger: Weapon {
    init() {
        super.init(damages: 12)
    }
}
final class Bow: Weapon {
    init() {
        super.init(damages: 15)
    }
}
final class Axe: Weapon {
    init() {
        super.init(damages: 15)
    }
}
final class Hammer: Weapon {
    init() {
        super.init(damages: 15)
    }
}

final class MagicSword: Weapon {
    init() {
        super.init(damages: 50)
    }
}


