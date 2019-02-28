//
//  ThirdViewController.swift
//  Abhinay_Guesser
//
//  Created by Student on 2/27/19.
//  Copyright © 2019 edu.nwmissouri. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var MinLBL: UILabel!
    
    @IBAction func ClearStatisticsBTN(_ sender: Any) {
        MinLBL.text = "0"
        MaxLBL.text = "0"
        MeanLBL.text = "0.0"
        StdDevLBL.text = "0.0"
        Guesser.shared.clearStatistics()
    }
    @IBOutlet weak var StdDevLBL: UILabel!
    @IBOutlet weak var MeanLBL: UILabel!
    @IBOutlet weak var MaxLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        updateLabels()
    }
    func updateLabels(){
        MinLBL.text = String(Guesser.shared.minimumNumAttempts())
        MaxLBL.text = String(Guesser.shared.maximumNumAttempts())
        var count = 0
        var mean = 0.0
        for i in 0..<Guesser.shared.numGuesses(){
            count += Guesser.shared.guess(index: i).numAttemptsRequired
        }
        if Guesser.shared.numGuesses() != 0 {
            mean = Double(count)/Double(Guesser.shared.numGuesses())
        }
        MeanLBL.text = String(format: "%.2f", mean)
        var stdDevSum = 0.0
        var stdDev = 0.0
        for i in 0..<Guesser.shared.numGuesses(){
            stdDevSum += pow(Double(Guesser.shared.guess(index: i).numAttemptsRequired) - mean, 2)
        }
        if Guesser.shared.numGuesses() != 0 {
            stdDev = stdDevSum/Double(Guesser.shared.numGuesses())
        }
        StdDevLBL.text = String(format: "%.2f", stdDev)
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


