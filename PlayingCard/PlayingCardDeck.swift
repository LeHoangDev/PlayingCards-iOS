//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Manh Hoang Le on 20.08.19.
//  Copyright © 2019 Manh Hoang Le. All rights reserved.
//

import Foundation

struct PlayingCardDeck{
    
    let LOG_TAG = "PlayingCardDeck: "
    private(set) var cards = [PlayingCard]()
    
    
    init(){
        print(LOG_TAG + "init()")
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    //Draw (pulls) a card
    mutating func draw() -> PlayingCard? {
        print(LOG_TAG + "draw()")
        if cards.count > 0 {
            print(LOG_TAG + "draw() cards.count: \(cards.count)")
            return cards.remove(at: cards.count.arc4random)
        } else {
            print(LOG_TAG + "draw() cards.count: empty")
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
