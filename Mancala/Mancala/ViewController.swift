//
//  ViewController.swift
//  Mancala
//
//  Created by Utku Dora on 11/04/16.
//  Copyright © 2016 Utku Dora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let MIN = 1
    let MAX = 0
    
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

    
    @IBAction func button1Action(sender: AnyObject) {
        takeMove(0, minOrmax: 1)
        updateLabels(board)
        
        
    }
    
    @IBAction func button2Action(sender: AnyObject) {
        
        takeMove(1, minOrmax: 1)
        updateLabels(board)
        
    }
    

    @IBAction func button3Action(sender: AnyObject) {
        takeMove(2, minOrmax: 1)
        updateLabels(board)
        
        
    }
    
    @IBAction func button4Action(sender: AnyObject) {
        takeMove(3, minOrmax: 1)
        updateLabels(board)
        
    }
    
    @IBAction func button5Action(sender: AnyObject) {
        takeMove(4, minOrmax: 1)
        updateLabels(board)
        
    }
    @IBAction func button6Action(sender: AnyObject) {
        takeMove(5, minOrmax: 1)
        updateLabels(board)
        
    }
    func takeMove(choice:Int,minOrmax:Int)->Bool{
        var avoid:Int//location to avoid, the other person's mancala
        if (MAX == minOrmax){ //comp playing
            avoid = 6;
        }
        else {//user playing
            avoid = 13;
        }
        var picked = board[choice]; //pick up the marbles and store them
        var next = choice + 1; //find the next bin number
        if(next == avoid){ //if this has to be avoided, be sure to change it
            if (avoid == 13){
                    next = 0; //avoid comp mancala for human
                            }
            else if( avoid == 6){
                    next = 7;//avoid human mancala for comp
                                }
                        }
        board[choice] = 0; //empty bin just picked
        var changed = false;//if the for loop runs into 13 or 6, this make sure that it doesn't increment twice.
        
        
         //for( ; picked > 0 ; picked-=1)
        
        
     for( ; picked > 0 ; picked-=1) { //as long as the number of marbles picked up is less than 0 and decreasing with every iteration
        if(next == avoid){//after each increment, this check to make sure that the next bin number is not an avoider
                if (avoid == 13){
                    changed = true; //next is where 1 marble will be placed. changed is true because it avoids incrementing twice
                    next = 0; //since we are avoiding 13, the next bin is 0
                                }
                else {
				changed = true; //next is where 1 marble will be placed. changed is true because it avoids incrementing twice
				next = 7;//since we are avoiding 6, the next bin is 7
                        }
                }
            var currentinnext = board[next]; //get the current number of marbles in the next bin to be added 1
            board[next] = currentinnext + 1 ; // add one to the value of the marbles in the next bin
            var test = picked - 1; //to see if there will be no more marbles left to drop.
            if (test >= 0){
                if(changed){
				next+=1 //increment to next
                    if(next == 14){ //make sure that the array loops
                        next = 0;
                                    }
                            }
                    else if (picked == 1 && currentinnext == 0){
                        break; //if last has only one to be dropped.
                            }
                else{
                    next+=1;
				if(next == 14){
                        next = 0;
				}
                }
            }
        }
        var ending = next-1;// location of ending bin
        if (ending == -1){ // incase it ends after looping array
            ending = 13;
        }
        else if (ending == 7){
            ending = 6;
        }
    if (MAX == minOrmax && ending == 6){ //this is a special condition that had to be hardcoded
    ending = ending + 1;
    }
    if (MAX == minOrmax){ //Increment ending to be used later
    ending = ending + 1; //for comp
    }
    if (MIN == minOrmax){//Increment ending to be used later
    ending = ending + 1; //for human
    }
    if(ending != 13 || ending != 6){ // make sure that it doesn't find across if landed in mancala
    
    if (MIN == minOrmax && board[ending] == 1 && ending > -1 && ending < 6){ // for human
				var across = 12 - ending; // find across slot
				if (board[across] > 0){
                    board[6] = board[6] + 1 + board[across]; // take the piece just landed
                    board[ending] = 0;//empty bin on human side
                    board[across] = 0; //empty bin across
                    return true;//return true if across value was captured. used in eval
				}
				else{
                    return false;
				}
    }
    if (MAX == minOrmax && board[ending] == 1 && ending > 6 && ending < 13){ // for comp
				var across = 12 - ending // find across slot
				if (board[across] > 0){
                    board[13] = board[13] + 1 + board[across]; // take the piece just landed
                    board[ending] = 0; //empty bin on comp side
                    board[across] = 0; //empty bin across
                    return true;//return true if across value was captured. used in eval
				}
				else{
                    return false;
				}
        }
        }
        else{
            return false;
        }
            return false;
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

