//
//  ViewController.swift
//  Dices
//
//  Created by Cristian Sedano Arenas on 3/1/19.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    
    var randomDiceIndexLeft : Int = 0
    var randomDiceIndexRight : Int = 0
    let diceImages : [String]
    let nFaces : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        
        diceImages = ["dice1","dice2","dice3","dice4","dice5","dice6"]
        nFaces = UInt32(diceImages.count)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateRandomDicde()
    }

    @IBAction func rollPressed(_ sender: UIButton) {
        generateRandomDicde()
    }
    
    func generateRandomDicde(){
        
        
        randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
        randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        
        imageViewDiceLeft.image = UIImage(named: diceImages[randomDiceIndexLeft])
        imageViewDiceRight.image = UIImage(named: diceImages[randomDiceIndexRight])
    }
}

