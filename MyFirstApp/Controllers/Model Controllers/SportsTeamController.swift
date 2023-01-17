//
//  SportsTeamController.swift
//  MyFirstApp
//
//  Created by Jacob Perez on 1/14/23.
//

import Foundation

class SportsTeamController {
    
    static let shared = SportsTeamController()
    
    var sportTeams: [SportsTeam] = []
    
    func createTeam(with name: String, rank: Int, count: Int) {
        let sportsTeam = SportsTeam(teamName: name, ranking: rank, playerCount: count)
        sportTeams.append(sportsTeam)
    }
    func updateTeam(teamToUpdate: SportsTeam, newName: String, newRanking: Int, newPlayerCount: Int) {
        teamToUpdate.teamName = newName
        teamToUpdate.ranking = newRanking
        teamToUpdate.playerCount = newPlayerCount
    }
    func deleteTeam(teamToDelete: SportsTeam){
        guard let index = sportTeams.firstIndex(of: teamToDelete) else { return }
        sportTeams.remove(at: index)
    }

}
