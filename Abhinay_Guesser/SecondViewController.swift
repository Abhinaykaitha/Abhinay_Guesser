//
//  SecondViewController.swift
//  Abhinay_Guesser
//
//  Created by Student on 2/27/19.
//  Copyright © 2019 edu.nwmissouri. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Guesser.shared.numGuesses()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history")!
        cell.textLabel?.text = "Correct Answer: " + String(Guesser.shared[indexPath.row].correctAnswer)
        cell.detailTextLabel?.text = "# Attempts: " + String(Guesser.shared[indexPath.row].numAttemptsRequired)
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        SecondView.reloadData()
    }
    
    @IBOutlet weak var SecondView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SecondView.dataSource = self
        SecondView.delegate = self
    }


}

