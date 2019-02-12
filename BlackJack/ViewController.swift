//
//  ViewController.swift
//  BlackJack
//
//  Created by Emmett Hasley on 1/16/19.
//  Copyright © 2019 John Heresy High School. All rights reserved.
//

import UIKit

class Card {
    var name : String
    var value : Int
    var isAce : Bool
    init(_ nam : String, _ numb : Int) {
        name = nam
        value = numb
        isAce = false
    }
}
var aceOS = Card("AOS", 11)
var twoOS = Card("2OS", 2)
var threeOS = Card("3OS", 3)
var fourOS = Card("4OS", 4)
var fiveOS = Card("5OS", 5)
var sixOS = Card("6OS", 6)
var sevenOS = Card("7OS", 7)
var eightOS = Card("8OS", 8)
var nineOS = Card("9OS", 9)
var tenOS = Card("10OS", 10)
var jackOS = Card("JOS", 10)
var queenOS = Card("QOS", 10)
var kingOS = Card("KOS", 10)
var aceOH = Card("AOH", 11)
var twoOH = Card("2OH", 2)
var threeOH = Card("3OH", 3)
var fourOH = Card("4OH", 4)
var fiveOH = Card("5OH", 5)
var sixOH = Card("6OH", 6)
var sevenOH = Card("7OH", 7)
var eightOH = Card("8OH", 8)
var nineOH = Card("9OH", 9)
var tenOH = Card("10OH", 10)
var jackOH = Card("JOH", 10)
var queenOH = Card("QOH", 10)
var kingOH = Card("KOH", 10)
var aceOD = Card("AOD", 11)
var twoOD = Card("2OD", 2)
var threeOD = Card("3OD", 3)
var fourOD = Card("4OD", 4)
var fiveOD = Card("5OD", 5)
var sixOD = Card("6OD", 6)
var sevenOD = Card("7OD", 7)
var eightOD = Card("8OD", 8)
var nineOD = Card("9OD", 9)
var tenOD = Card("10OD", 10)
var jackOD = Card("JOD", 10)
var queenOD = Card("QOD", 10)
var kingOD = Card("KOD", 10)
var aceOC = Card("AOC", 11)
var twoOC = Card("2OC", 2)
var threeOC = Card("3OC", 3)
var fourOC = Card("4OC", 4)
var fiveOC = Card("5OC", 5)
var sixOC = Card("6OC", 6)
var sevenOC = Card("7OC", 7)
var eightOC = Card("8OC", 8)
var nineOC = Card("9OC", 9)
var tenOC = Card("10OC", 10)
var jackOC = Card("JOC", 10)
var queenOC = Card("QOC", 10)
var kingOC = Card("KOC", 10)
class ViewController: UIViewController {
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card1: UIImageView!
    var card0 : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aceOS.isAce = true
        aceOH.isAce = true
        aceOD.isAce = true
        aceOC.isAce = true
        card1.image = UIImage(named: "BackOfCard")
        value.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }
    var deck = [aceOS, twoOS, threeOS, fourOS, fiveOS, sixOS, sevenOS, eightOS, nineOS, tenOS, jackOS, queenOS, kingOS, aceOH, twoOH, threeOH, fourOH, fiveOH, sixOH, sevenOH, eightOH, nineOH, tenOH, jackOH, queenOH, kingOH, aceOD, twoOD, threeOD, fourOD, fiveOD, sixOD, sevenOD, eightOD, nineOD, tenOD, jackOD, queenOD, kingOD, aceOC, twoOC, threeOC, fourOC, fiveOC, sixOC, sevenOC, eightOC, nineOC, tenOC, jackOC, queenOC, kingOC]
    var active = [Card]()
    var stood = false
    var numbOPlayers = 1
    var nextCard = 4
    @IBAction func whenDealed(_ sender: Any) {
        deck.shuffle()
        var theCards = [card1, card2, card3, card4]
        for x in theCards {
            x!.image = nil
        }
        for x in deck {
            if x.isAce == true {
                x.value = 11
            }
        }
        active.removeAll()
        card1.image = UIImage(named: deck[0].name)
        active.append(deck[0])
        card2.image = UIImage(named: deck[1].name)
        active.append(deck[1])
        nextCard = numbOPlayers * 2
        getValue()
        stood = true
        if Int(value.text!)! == 21 {
            value.text! += "!"
        }
    }
    
    @IBAction func whenFlipped(_ sender: Any) {
        if stood == false {
            card2.image = UIImage(named: deck[1].name)
            active.append(deck[1])
            getValue()
            stood = true
        }
    }
    @IBAction func whenHit(_ sender: Any) {
        var cardSpaces = [card1, card2, card3, card4]
        if nextCard >= deck.count || nextCard >= cardSpaces.count {
            
        } else {
            cardSpaces[nextCard]!.image = UIImage(named: deck[nextCard].name)
            active.append(deck[nextCard])
            nextCard += 1
            getValue()
            var counter = 0
            while Int(value.text!)! > 21 && counter <= 100 {
                counter += 1
                for x in active {
                    if x.isAce {
                        x.value = 1
                        getValue()
                        }
                    }
                }
            if Int(value.text!)! > 21 {
                value.text! += " Bust!"
            }
            }
        }
    func getValue() {
        var val = 0
        for x in active {
            val += x.value
        }
        value.text = String(val)
    }
}

