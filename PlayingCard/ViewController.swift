//
//  ViewController.swift
//  PlayingCard
//
//  Created by Manh Hoang Le on 20.08.19.
//  Copyright © 2019 Manh Hoang Le. All rights reserved.
//
/*
 IBOutlet reference to the view-object
 IBAction action listener
 
 
*/


import UIKit

/// Controlls View and the Model
class ViewController: UIViewController {
    
    let LOG_TAG = "ViewController: "
    var deck = PlayingCardDeck()
    
    //Reference to the playingCardView
    @IBOutlet weak var playingCardView: PlayingCardView!{
        //Will be called before viewDidLoad
        didSet {
            print(LOG_TAG + "IBOutlet playingCardView didSet{...}")
            //Create swipe gesture recognizer for PlayingCardView
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            //Add swipe gesture to the view
            playingCardView.addGestureRecognizer(swipe)
            
            //Create pinch gesture recognizer for PlayingCardview
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizeBy:)))
            //Add pinch gesture to the view
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    //Change FaceUp Mode
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        print(LOG_TAG + "IBAction() flipCard")
        switch sender.state{
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
        
        
    }
    
    //Updates PLayingCardView with the next card
    @objc func nextCard(){
        print(LOG_TAG + "nextCard()")
        if let card = deck.draw(){
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    //View did Load Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(LOG_TAG + "viewDidLoad()")
    }


}

