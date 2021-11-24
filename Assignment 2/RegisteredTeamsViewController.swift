//
//  RegisteredTeamsViewController.swift
//  Assignment 2
//
//  Created by user928878 on 11/21/21.
//
//Class used for all teams that are registered.

import UIKit

class RegisteredTeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var searchTeamID = [String]()
    var searching = false
    var teamid_list = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataManager.shared.selectedTeam = DataManager.shared.registered_profiles[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchTeamID.count
        }
        else {
            return DataManager.shared.registered_profiles.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegisteredProfile", for: indexPath)
        if searching {
            cell.textLabel?.text = searchTeamID[indexPath.row]
        }
        else {
            cell.textLabel?.text = DataManager.shared.registered_profiles[indexPath.row].id
        }
        return cell
    }
    
    //Override search bar functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTeamID = teamid_list.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for element in DataManager.shared.registered_profiles {
            teamid_list.append(element.id)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
