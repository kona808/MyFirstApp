//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Jacob Perez on 1/14/23.
//

import UIKit

class SportTeamsDetailViewController: UIViewController {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var rankingTextField: UITextField!
    @IBOutlet weak var playerCountTextField: UITextField!
    @IBOutlet weak var playerCountLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var clearButtton: UIButton!
    
    // Reciever, is it nil?
    var sportTeamReciever: SportsTeam?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.title = "Sports Team"
        updateViews()
    }
    //MARK: - Methods
    func updateViews () {
        guard let sportTeam = sportTeamReciever else { return }

        teamNameTextField.text = sportTeam.teamName
        rankingTextField.text = "\(sportTeam.ranking)"
        playerCountTextField.text = "\(sportTeam.playerCount)"
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let newName = teamNameTextField.text,
              let newRanking = Int(rankingTextField.text ?? "0"),
              let newPlayerCount = Int(playerCountTextField.text ?? "0") else {
            return }
        if let sportTeam = sportTeamReciever {
            SportsTeamController.shared
                .updateTeam(teamToUpdate: sportTeam, newName: newName, newRanking: newRanking, newPlayerCount: newPlayerCount)
            // if the reciever has a value the user is trying to UPDATE
        } else {
            // if the reciever has NO value the user is tryng to CREATE
            SportsTeamController.shared.createTeam(with: newName, rank: newRanking, count: newPlayerCount)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        teamNameTextField.text = ""
        rankingTextField.text = ""
        playerCountTextField.text = ""
    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let reciever = sportTeamReciever else { return }
                SportsTeamController.shared.deleteTeam(teamToDelete: reciever)
        navigationController?.popViewController(animated: true)
    }
   
}

