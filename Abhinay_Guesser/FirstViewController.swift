//
//  FirstViewController.swift
//  Abhinay_Guesser
//
//  Created by Student on 2/27/19.
//  Copyright © 2019 edu.nwmissouri. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBAction func CreateNewProblemBT(_ sender: Any) {
        CorrectAnswerLBL.text = ""
        MyGuessTF.text = ""
        Guesser.shared.createNewProblem()
    }
    
    
    @IBAction func AmIRightBT(_ sender: Any) {
        if let value = Int(MyGuessTF.text!) {
            let result = Guesser.shared.amIRight(guess: Int(value))
            CorrectAnswerLBL.text = result.rawValue
            if result == Result.correct{
                CorrectAnswerLBL.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                displayMessage()
                Guesser.shared.createNewProblem()
            }else if result.rawValue.contains("Too") {
                CorrectAnswerLBL.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                
            }
        }else{
            errorMessage()
        }
    }
    @IBOutlet weak var CorrectAnswerLBL: UILabel!
    @IBOutlet weak var MyGuessTF: UITextField!
    
    func displayMessage(){
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(Guesser.shared.numAttempts) attempts",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func errorMessage(){
        let alert = UIAlertController(title: "Invalid Input",
                                      message: "You have entered an invalid input. Please enter a value from range 1-10",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    Guesser.shared.createNewProblem()
    }


}

