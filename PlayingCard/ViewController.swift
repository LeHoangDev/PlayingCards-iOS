//
//  ViewController.swift
//  PlayingCard
//
//  Created by Manh Hoang Le on 20.08.19.
//  Copyright © 2019 Manh Hoang Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = deck.draw(){
                print("\(card)")
            }
        }
    }


}

