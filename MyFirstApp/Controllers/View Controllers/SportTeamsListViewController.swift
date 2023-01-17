//
//  SportTeamsListTableViewController.swift
//  MyFirstApp
//
//  Created by Jacob Perez on 1/14/23.
//

import UIKit

class SportTeamsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetailVC" {
            /// Index - Discovering what row the user has selected
            if let index = tableView.indexPathForSelectedRow {
                /// Destination - Verifying the segues destination leads to the * ViewController* we want. This also allows us to access the properties on that *ViewController*
                if let destination = segue.destination as? SportTeamsDetailViewController {
                    /// Object to send - Using the index we discovered earlier we retrieve the *SportTeam that matches in our * sportTeam* array.
                    let sportTeam = SportsTeamController.shared.sportTeams[index.row]
                    /// Object to receive - Sets the value of the optional * sportTeam* on the *destination* to the *sportTeam* we just retrived
                    destination.sportTeamReciever = sportTeam
                }
            }
        }
    }

} // END of class
// MARK: - Table view data source
extension SportTeamsListViewController: UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SportsTeamController.shared.sportTeams.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? SportTeamsListTableViewCell else { return UITableViewCell() }

        let sportTeam = SportsTeamController.shared.sportTeams[indexPath.row]
         
         cell.configureCell(with: sportTeam)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let sportTeam = SportsTeamController.shared.sportTeams[indexPath.row]
            SportsTeamController.shared.deleteTeam(teamToDelete: sportTeam)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
