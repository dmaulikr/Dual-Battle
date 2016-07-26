//
//  ViewController.swift
//  Dual-Battle
//
//  Created by Mark Laukkanen on 24/07/16.
//  Copyright © 2016 Mark Laukkanen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//IBOutlets
    
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
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBOutlet weak var playAgainLbl: UILabel!
    
    
//Variables
    
    var player1: Character!
    var player2: Character!
    
    var currentAttackPower: Int = 15
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Character(startingHp: 100)
        player2 = Character(startingHp: 100)
    
    
    }
 
//IBActions
    
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
    
    @IBAction func onPlayer1Attack(sender: UIButton) {
        
        currentAttackPower = player1.attackPwr
        
        player2.wasAttacked(currentAttackPower)
        
        if !player2.isAlive {
            printLbl.text = "Player 2 was killed."
            hidePlayer2()
            
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.goToReplayScreen), userInfo: nil, repeats: false)
            
        } else {
            printLbl.text = "Player 2 lost \(currentAttackPower) HP"
            player2HpLbl.text = "\(player2.HP) HP"
            
            player2AttackBtn.hidden = true
            player2AttackLbl.hidden = true
            
            if player2.isAlive {
            revealAttackBtnsDelay()
            }
        }

    }
    
    @IBAction func onPlayer2Attack(sender:UIButton) {
        
        currentAttackPower = player2.attackPwr
        
        player1.wasAttacked(currentAttackPower)
        
        if !player1.isAlive {
            printLbl.text = "Player 1 was killed."
            hidePlayer1()
            
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.goToReplayScreen), userInfo: nil, repeats: false)
            
        } else {
            printLbl.text = "Player 1 lost \(currentAttackPower) HP"
            player1HpLbl.text = "\(player1.HP) HP"
            
            player1AttackBtn.hidden = true
            player1AttackLbl.hidden = true
            
            if player1.isAlive {
            revealAttackBtnsDelay()
            }
            
            //attackpwr changes every time
        }
    }
    
    @IBAction func playAgain(sender: UIButton) {
        playAgainLbl.hidden = true
        playAgainBtn.hidden = true
        selectOrcBtn.hidden = false
        selectSoldierBtn.hidden = false
        printLbl.text = "Player 1, select a character."
        player1 = Character(startingHp: 100)
        player2 = Character(startingHp: 100)
    }

   
//Functions
    
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
    
    func hidePlayer2() {
        player2Orc.hidden = true
        player2Soldier.hidden = true
        player2HpLbl.hidden = true
        player2AttackLbl.hidden = true
        player2AttackBtn.hidden = true
    }
    
    func hidePlayer1() {
        player1Orc.hidden = true
        player1Soldier.hidden = true
        player1HpLbl.hidden = true
        player1AttackBtn.hidden = true
        player1AttackLbl.hidden = true
    }
    
    func revealAttackBtnsDelay() {
        NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: #selector(ViewController.revealAttackBtns), userInfo: nil, repeats: false)
    }
    
    func goToReplayScreen() {
        printLbl.text = ""
        hidePlayer1()
        hidePlayer2()
        playAgainBtn.hidden = false
        playAgainLbl.hidden = false
    }
  
}

