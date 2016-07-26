//
//  ViewController.swift
//  Dual-Battle
//
//  Created by Mark Laukkanen on 24/07/16.
//  Copyright © 2016 Mark Laukkanen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var player1HpLbl: UILabel!
    @IBOutlet weak var player2HpLbl: UILabel!
    
    @IBOutlet weak var player1Orc: UIImageView!
    @IBOutlet weak var player1Soldier: UIImageView!
    
    @IBOutlet weak var player2Orc: UIImageView!
    @IBOutlet weak var player2Soldier: UIImageView!
    
    @IBOutlet weak var player1AttackBtn: UIButton!
    @IBOutlet weak var player2AttackBtn: UIButton!
    @IBOutlet weak var player1AttackLbl: UILabel!
    @IBOutlet weak var player2AttackLbl: UILabel!
    
    @IBOutlet weak var selectOrcBtn: UIButton!
    @IBOutlet weak var selectSoldierBtn: UIButton!
    
    var player1: Character!
    var player2: Character!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Character(startingHp: 100, attackPwr: 15)
        player2 = Character(startingHp: 100, attackPwr: 15)
    
    
    }
    
    @IBAction func onOrcSelected(sender: AnyObject) {
        if player1.type == "" {
            player1.type = "Orc"
            player1Orc.hidden = false
            printLbl.text = "Player 2, select a character."
        } else {
            player2.type = "Orc"
            player2Orc.hidden = false
            initializeBattle()
        }
    }
    
    @IBAction func onSoldierSelected(sender: AnyObject) {
        if player1.type == "" {
            player1.type = "Soldier"
            player1Soldier.hidden = false
            printLbl.text = "Player 2, select a character."
        } else {
            player2.type = "Soldier"
            player2Soldier.hidden = false
            initializeBattle()
        }
    }

    
    func initializeBattle() {
        selectOrcBtn.hidden = true
        selectSoldierBtn.hidden = true
        
        printLbl.text = "Let the battle begin!"
        
        player1HpLbl.hidden = false
        player1HpLbl.text = "\(player1.HP) HP"
        
        player2HpLbl.hidden = false
        player2HpLbl.text = "\(player2.HP) HP"
        
        revealAttackBtns()
    }
    
    func revealAttackBtns() {
        player1AttackBtn.hidden = false
        player2AttackBtn.hidden = false
        player1AttackLbl.hidden = false
        player2AttackLbl.hidden = false
    }
  

}

