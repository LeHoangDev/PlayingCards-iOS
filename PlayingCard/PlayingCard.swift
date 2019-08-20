//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Manh Hoang Le on 20.08.19.
//  Copyright © 2019 Manh Hoang Le. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible{
    
    var description: String {return "\(rank)\(suit)"}
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible{
        var description: String {
            switch self{
            case .spades: return "♠️"
            case .hearts: return "♥️"
            case .diamonds: return "♦️"
            case .clubs: return "♣️"
            }
        }
        
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        static var all = [Suit.spades, .hearts,.diamonds, .clubs]
    }
    
    
    
    enum Rank: CustomStringConvertible{
        var description: String {
            switch self{
                case .ace: return String(1)
                case .numeric(let pips): return String(pips)
                case .face(let kind) where kind == "J": return "J 11"
                case .face(let kind) where kind == "Q": return "Q 12"
                case .face(let kind) where kind == "K": return "K 13"
                default: return String(0)
            }
        }

        
        case ace
        case face(String)
        case numeric(pipsCount: Int)
        
        var order: Int {
            switch self{
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
                //case .face(let kind): return kind
            default: return 0
            }
        }
        
        static var all: [Rank]{
        
        //Add all Cards in allRanks
        var allRanks = [Rank.ace]
        for pips in 2...10{
            allRanks.append(Rank.numeric(pipsCount: pips))
        }
        allRanks += [Rank.face("J"), face("Q"), face("K")]
        return allRanks
        }
    }
}
