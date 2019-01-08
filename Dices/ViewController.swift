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
    @IBOutlet weak var result: UILabel!
    
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
        
        let nameImageDiceLeft = diceImages[randomDiceIndexLeft]
        let nameImageDiceRight = diceImages[randomDiceIndexRight]
        
        let diceLeft: Int? = Int(randomDiceIndexLeft)
        let diceRight: Int? = Int(randomDiceIndexRight)
        let convert = diceLeft! + diceRight!
        let convertDice = String(convert+2)
        
        result.text = convertDice
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        
                        self.imageViewDiceLeft.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                            .concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2))
                            .concatenating(CGAffineTransform(translationX: 0, y: 60))
                        
                        self.imageViewDiceRight.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                            .concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2))
                            .concatenating(CGAffineTransform(translationX: -60, y: 60))
                        
                        self.imageViewDiceLeft.alpha = 0.0
                        self.imageViewDiceRight.alpha = 0.0
            
        }) { (completed) in
            
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            self.imageViewDiceRight.transform = CGAffineTransform.identity
            
            self.imageViewDiceLeft.alpha = 1.0
            self.imageViewDiceRight.alpha = 1.0
            
            self.imageViewDiceLeft.image = UIImage(named: nameImageDiceLeft)
            self.imageViewDiceRight.image = UIImage(named: nameImageDiceRight)
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake{
            
            generateRandomDicde()
        }
    }
}

