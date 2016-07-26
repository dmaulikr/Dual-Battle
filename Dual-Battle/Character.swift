//
//  Character.swift
//  Dual-Battle
//
//  Created by Mark Laukkanen on 24/07/16.
//  Copyright © 2016 Mark Laukkanen. All rights reserved.
//

import Foundation

class Character {
    private var _HP: Int = 0
    private var _name: String = ""
    
    var attackPwrOptions: [Int] {
        return [1, 4, 5, 6, 7, 8, 9, 10, 15, 20, 40]
    }
    
    var attackPwr: Int {
            let rand = Int(arc4random_uniform(UInt32(attackPwrOptions.count)))
            return attackPwrOptions[rand]
    }
    
    var type: String = ""
    
    var HP: Int {
        get {
            return _HP
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if HP <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int) {
        self._HP = startingHp
    }
    
    func wasAttacked(attackPwr: Int) {
        self._HP -= attackPwr
    }
    
    
    
}