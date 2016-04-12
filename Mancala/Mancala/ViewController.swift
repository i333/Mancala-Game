//
//  ViewController.swift
//  Mancala
//
//  Created by Utku Dora on 11/04/16.
//  Copyright © 2016 Utku Dora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var oponentMancala: UILabel!
    @IBOutlet weak var PlayerMancala: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    var answerButton: Array<UIButton> = []
    
    
   var board = [4,4,4,4,4,4,0,4,4,4,4,4,4,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerButton.append(button1);
        answerButton.append(button2);
        answerButton.append(button3);
        answerButton.append(button4);
        answerButton.append(button5);
        answerButton.append(button6);
        
        answerButton.append(button7);
        answerButton.append(button8);
        answerButton.append(button9);
        answerButton.append(button10);
        answerButton.append(button11);
        answerButton.append(button12);
        
        // Do any additional setup after loading the view, typically from a nib.
        updateLabels(board)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateLabels(board:[Int]){
    
        var i = 0
        for button in answerButton {
            if (i==6){
                i += 1
            }
            button.setTitle("\(board[i])", forState: UIControlState.Normal)
            i+=1
        }
    
        
        oponentMancala.text = "\(board[13])"
        PlayerMancala.text = "\(board[6])"
        
    
    }
    
    

}

