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
    private var _attackPwr: Int = 0
    private var _name: String = ""
    
    var type: String = ""
    
    var HP: Int {
        get {
            return _HP
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
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
    
    init(startingHp: Int, attackPwr: Int) {
        self._HP = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._HP -= attackPwr
        return true
    }
    
    
    
}