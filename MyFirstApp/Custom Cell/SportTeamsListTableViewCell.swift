//
//  SportTeamsListTableViewCell.swift
//  MyFirstApp
//
//  Created by Jacob Perez on 1/16/23.
//

import UIKit

class SportTeamsListTableViewCell: UITableViewCell {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamRankLabel: UILabel!
    @IBOutlet weak var playerCountLabel: UILabel!
    
    func configureCell(with sportTeam: SportsTeam) {
        teamNameLabel.text = sportTeam.teamName
        teamRankLabel.text = "\(sportTeam.ranking)"
        playerCountLabel.text = "\(sportTeam.playerCount)"
        
    }
}
