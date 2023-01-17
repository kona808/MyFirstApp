//
//  SportsTeam.swift
//  MyFirstApp
//
//  Created by Jacob Perez on 1/14/23.
//

import Foundation

class SportsTeam {
    
    var teamName: String
    var ranking: Int
    var playerCount: Int
    
    init(teamName: String, ranking: Int, playerCount: Int) {
        self.teamName = teamName
        self.ranking = ranking
        self.playerCount = playerCount
    }
}
extension SportsTeam: Equatable {
    static func == (lhs: SportsTeam, rhs: SportsTeam) -> Bool {
        return lhs.teamName == rhs.teamName &&
        lhs.ranking == rhs.ranking &&
        lhs.playerCount == rhs.playerCount
    }
}
