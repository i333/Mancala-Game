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
    var maxDepth = 5
    
    @IBOutlet weak var insaneDifficultyButton: UIButton!
    @IBOutlet weak var hardDifficultyButton: UIButton!
    @IBOutlet weak var mediumDifficultyButton: UIButton!
    @IBOutlet weak var difficultyButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
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
    var difficultyButtons: Array<UIButton> = []
    
   var board = [4,4,4,4,4,4,0,4,4,4,4,4,4,0]
    
    
    struct Move {
        var binNum:Int?
        var score:Int?
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        difficultyButtons.append(mediumDifficultyButton)
        difficultyButtons.append(hardDifficultyButton)
        difficultyButtons.append(insaneDifficultyButton)
        for button in difficultyButtons{
         button.hidden = true
        }
        
        restartButton.hidden = true
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
    func endGame(){
    scoreLabel.hidden = false
        if (board[6] > board[13]){
           scoreLabel.text =  "Human wins!"
        }
        else if (board[13] > board[6]){
            scoreLabel.text = "Computer wins, as expected."
        }
        else {
            scoreLabel.text = "Game is a tie!"         }

        for button in answerButton {
            
        button.hidden = true
        
        }
    restartButton.hidden = false
    
    }
    
    @IBAction func changeDifficulty(sender: AnyObject) {
        for button in answerButton {
            
            button.hidden = true
            
        }
        PlayerMancala.hidden = true
        oponentMancala.hidden = true
        difficultyButton.hidden = true
        for button in difficultyButtons{
        button.hidden = false
        }
    }
    @IBAction func setHardDifficulty(sender: AnyObject) {
        setDifficulty(4)
    }
   
    @IBAction func setInsaneDifficulty(sender: AnyObject) {
        setDifficulty(7)
    }
    
    @IBAction func setMediumDifficulty(sender: AnyObject) {
      setDifficulty(2)
    }
    func setDifficulty(dept:Int){
    
        maxDepth = dept
        for button in difficultyButtons{
            button.hidden = true
        }
        for button in answerButton {
            
            button.hidden = false
            
        }
        PlayerMancala.hidden = false
        oponentMancala.hidden = false
        difficultyButton.hidden = false

    
    
    
    }
    @IBAction func restart(sender: AnyObject) {
        board = [4,4,4,4,4,4,0,4,4,4,4,4,4,0]
        updateLabels(board)
        restartButton.hidden = true
        scoreLabel.hidden = true
        for button in answerButton {
            
            button.hidden = false
            
        }
        
    }
    @IBAction func button1Action(sender: AnyObject) {
        
        if (board[0] != 0) {
        takeMove(0, minOrmax: 1)
        updateLabels(board)
        computerMove()
       
        updateLabels(board)
        if(checkBoard()){
        endGame()
        }
        }
        
    }
    
    @IBAction func button2Action(sender: AnyObject) {
        if (board[1] != 0) {
        takeMove(1, minOrmax: 1)
        updateLabels(board)
        computerMove()
        updateLabels(board)
        if(checkBoard()){
            endGame()
            }}
    }
    

    @IBAction func button3Action(sender: AnyObject) {
        if (board[2] != 0) {
        takeMove(2, minOrmax: 1)
        updateLabels(board)
        computerMove()
        updateLabels(board)
        if(checkBoard()){
            endGame()
        }
        }
    }
    
    @IBAction func button4Action(sender: AnyObject) {
        if (board[3] != 0) {
        takeMove(3, minOrmax: 1)
        updateLabels(board)
        computerMove()
        updateLabels(board)
        if(checkBoard()){
            endGame()
        }
        }
    }
    
    @IBAction func button5Action(sender: AnyObject) {
        if (board[4] != 0) {
        takeMove(4, minOrmax: 1)
        updateLabels(board)
        computerMove()
        updateLabels(board)
        if(checkBoard()){
            endGame()
        }
        }
    }
    @IBAction func button6Action(sender: AnyObject) {
        if (board[5] != 0) {
        takeMove(5, minOrmax: 1)
        updateLabels(board)
        computerMove()
        updateLabels(board)
        if(checkBoard()){
            endGame()
            }
        }
    }
    
    
    
    func evalFunction(minOrMax:Int)->Int{ //minORMax arent really needed since we are using evalfunction to benefit comp
    var board2 = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]//for getting value lets copy board so it isn't messed up.
        var checkempty:Bool//check if it results in an empty bin location, if so then add the value of that.
    for j in 0...13{//(int j = 0; j < 14 ; j++)
        board2[j] = board[j]; //copy board 2
    }
        
        
        let humanBoardSum = board[0] + board[1] + board[2] + board[3] + board[4] + board[5]
    //get all the pieces on the human side, including mancala
    let humanSide = Double(humanBoardSum) * 0.45; //multiply by a constant
    //I am multiplying by 0.45 because it gives more variation.
    //this is also why floating point numbers are used, later converted to an int
    let humanMancala = Double( board[6] ) * 3.45; //multiple by a higher constant because these are guaranteed pieces, since in mancala already
    let human = humanSide + humanMancala; // find total for human pieces
    //get all the pieces on the comp side, including mancala
        
    let compBoardSum = board[7] + board[8] + board[9] + board[10] + board[11] + board[12]
        
    let compSide = Double(compBoardSum)  * 0.45; //multiply by a constant
    //I am multiplying by 0.45 because it gives more variation.
    //this is also why floating point numbers are used, later converted to an int
    let compMancala = Double(board[13]) * 3.45;//multiple by a higher constant because these are guaranteed pieces, since in mancala already
    let comp = compSide + compMancala; //find total for comp pieces
    let difference_board = comp - human; 	//find the difference between the two, negative doesn't make a difference.
    var valueofboard = Int(difference_board + 0.5); //this basically rounds the floating point number to the nearest integer.
    for i in 0...5 { //(int i = 0; i <= 5; i++)for each possible move for human
        checkempty = takeMove(i, minOrmax: minOrMax); //see if you can land in an empty bin
    if(checkempty){ //if you can land in an empty bin
        let acrosslocation = 12 - i; //find the location of that
        let acrosspieces = board2[acrosslocation]; //find how many pieces are across
    //add the number of pieces across plus the one on your side to the vale of the board
        valueofboard = Int(Double(valueofboard) + (Double(acrosspieces) * -0.5 ))//since we want the comp to not have to go to this state, we multiple by -1, adding negative
    }
    }
    for i in 7...12 { //(int i = 7; i <= 12; i++)for each possible move for comp
        checkempty = takeMove(i, minOrmax: minOrMax); //see if you can land in an empty bin
        if(checkempty){//if you can land in an empty bin
            let acrosslocation = 12-i//find the location of that
            let acrosspieces = board2[acrosslocation];//find how many pieces are across
    //add the number of pieces across plus the one on your side to the vale of the board
            valueofboard = Int(Double(valueofboard) + (Double(acrosspieces) * 0.5)) //we want comp to go to this state, so multiply by constant only
            }
        }
        return valueofboard; //regardless of if you can land in an empty bin, give back the value of the board.
    }

    
    
    
    func minmax(d:Int, maxD:Int,  minOrMax:Int,alpha:Int, beta:Int)->Move {
    //minOrMax is MAX if the computer is the player and MIN if the human is the player
    var mTemp = Move()
        var m = Move()
    
        var board2 = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]//no need to fill board with values, will be changed later on
        var check:Bool//for checking if one side is empty
    //bool doesntmatter;//return bool from takemove, for eval function and doens't matter here.
    check = checkBoard();//check if one side is emtpy.
 
      
    if (check){ //if (one side has all empty bins)
    //return INT_MAX as the score if MAX is playing and INT_MIN if MIN is playing; bin number not important
    if (MIN == minOrMax){ // Computer is playing
        m.score = Int.min;
        m.binNum = -1; //not important.
        return m;
    }
    else if (MAX == minOrMax){
        m.score = Int.max;
        m.binNum = -1; //not important
        return m;
        }
    }
    else  if (d == maxD)  {

        m.score = evalFunction( minOrMax); //evaluate the current board state and give a score.
     m.binNum = -1; //doesnt matter
    //return a struct with the score; bin number not important
    return m;
}
else {
    if (minOrMax == MIN) { // MINIMizing player
        m.score = Int.max;
        m.binNum = -1;
        for i in 0...5 { //user turn so only go through 6 bins on user side.
            if (board[i] != 0) {
                //Copy board into board2
                //for loop to copy board
                for j in 0...13{//(int j = 0; j < 14 ; j++)
                    board2[j] = board[j];
                }
                 takeMove(i, minOrmax: minOrMax);  //change board state to next tentative move
//
//              "MIN is recursively calling minmax, with an alpha of " << alpha << " and m.score (beta) of " << m.score

                mTemp = minmax(d+1, maxD: maxD, minOrMax: MAX, alpha: alpha, beta: m.score!); //recursive call minmax with m.score(as beta) and alpha
                if( m.score <= alpha){  //if m.score is less than alpha
                    break; //so break out of for loop
                }
                if (m.binNum == -1) { m.binNum = i }
                if (mTemp.score < m.score) { //
                    m.score = mTemp.score; //if the found score it less than the kept score, so update score kept.
                    m.binNum = i; //bin number will be current index
//less than because trying to minimize
}

//copy board2 back into board
                for k in 0...13{//(int k = 0; k < 14 ; k++)
                    board[k] = board2[k];
                    }
                }
            }
        return m;
    }
    else if (minOrMax == MAX) //comp
    {
    //Do this the same way as the previous case, changing the necessary variables and values to make it the flip-side, logically
        m.score = Int.min;
        m.binNum = -1;
        for i in 7...12 {//(int i = 7; i <= 12; i++)comp turn so only go through 6 bins on user side.
            if (board[i] != 0) {
                for j in 0...13{//(int j = 0; j < 14 ; j++)
                    board2[j] = board[j];
                }
            takeMove( i, minOrmax: minOrMax);  //change board state to next tentative move
//            cout << "MAX is recursively calling minmax, with an beta of " << beta << " and m.score (alpha) of " << m.score << endl;
                mTemp = minmax( d+1, maxD: maxD, minOrMax: MIN, alpha: m.score!, beta: beta); //recursive call minmax with m.score(as alpha) and beta
                if(m.score > beta){
                    break; //so break out of for loop
                }
                if (mTemp.score >= m.score) {
                    m.score = mTemp.score;//if the found score it greater than the kept score, so update score kept.
                    m.binNum = i;//bin number will be current index

                }
//copy board2 back into board
for k in 0...13{//(int k = 0; k < 14; k++)
    board[k] = board2[k];
            }
        }
    }
return m
            }	//end of else if
        }	//end of else
return m}

    
    func computerMove(){
        var moveIndex:Int
       let onlyone = checkForOne(board);
        if(onlyone){
                   let one = findOne(board);//find location of move.
            moveIndex = one;//set the found location as the move.
        }
        else{
            moveIndex = computerChooseMove(maxDepth);//otherwise use the minmax function to find the best move, given a certain depth.
        }
              takeMove(moveIndex, minOrmax: 0);
        let gameOver = checkBoard(); //see if the game is over
        if(gameOver){
            //do something with endgame
        }
    
    
    }
    
    
    func computerChooseMove(maxD:Int)->Int
    {
    var m = Move()
    let alpha = Int.min; // alpha
    let beta = Int.max; // beta

//    Initial Call for minmax just occurred

    m = minmax( 0, maxD: maxD, minOrMax: MAX, alpha: alpha, beta: beta); //initial call
       
    return m.binNum!; //found the value of best bin
}
    
    func checkBoard()->Bool{
        var bottomnumempty = 0; //see if bottom are empty
        for i in 0...5{
            if(board[i] == 0){
                bottomnumempty+=1; //check each one individual to see if 0
            }
        }
        if (bottomnumempty == 6){
            // if bottom are empty, then take all on comp side and deposit into comp mancala
            board[13] = board[13] + board[12] + board[11] + board[10] + board[9] + board[8] + board[7]
    for i in 7...12{
        board[i] = 0;//empty all on comp side
    }
            return true; //yes, its empty
    }
    var topnumempty = 0;
    for i in 7...12{//see if top are empty
        if(board[i] == 0){
            topnumempty+=1;//check each one individual to see if 0
            }
        }
    if (topnumempty == 6){
    // if top are empty, then take all on human side and deposit into human mancala
    board[6] = board[6] + board[5] + board[4] + board[3] + board[2] + board[1] + board[0];
    for i in 0...5{
        board[i] = 0;//empty all on human side
    }
        return true;//yes, its empty
    }
        return false;//no, its not empty, top 6 or bottom 6
    }
    
    
    
    func checkForOne(board:[Int])-> Bool{
        var check = 0;
        for i in 7...12 {
            if(board[i] > 0){
                check+=1; //for each possible move add one
            }
        }
        if(check == 1){ //if there is only one move possible.
            return true; //return true
        }
        else{
            return false; //else return false.
        }
    }
    
    
    func findOne(board:[Int])->Int{
        var check = 0;
        for i in 7...12 { //go through all comp bins
            if(board[i] > 0){
                check = i ; //find the bin location of the one possible move for comp
                return check;
            }
        }
        return check;
        }
    
    func takeMove(choice:Int,minOrmax:Int)->Bool{
        var avoid:Int//location to avoid, the other person's mancala
        if (MAX == minOrmax){ //comp playing
            avoid = 6;
        }
        else {//user playing
            avoid = 13;
        }
        if (choice == -1){
            endGame()
        return false}
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
            let currentinnext = board[next]; //get the current number of marbles in the next bin to be added 1
            board[next] = currentinnext + 1 ; // add one to the value of the marbles in the next bin
            let test = picked - 1; //to see if there will be no more marbles left to drop.
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
    if( ending == 14 ) {ending=0}
    if(ending != 13 || ending != 6){ // make sure that it doesn't find across if landed in mancala
        
    if (MIN == minOrmax && board[ending] == 1 && ending > -1 && ending < 6){ // for human
				let across = 12 - ending; // find across slot
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
				let across = 12 - ending // find across slot
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

