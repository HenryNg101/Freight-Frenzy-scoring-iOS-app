# iOS-Assignment-2
2nd iOS Assignment

All of classes and functions that I developed:
- ViewController: View Controller class for root view. Interact with API to receive data about teams in highscore table and all teams on the website

- DataManager: Manage all of temporary data with Singleton design pattern to keep data intact when the app is in use.
  + deleteAllInfo(): Delete all of records of all entity, only used for debugging purpose (When the data is messed up)
  + addTeamInfo(teamName: String, teamID: String, location: String, robotName: String, image: Data, allow_sharing: Bool): Add new team info to the Core Data when a team is registered.
  + loadTeamInfosFromCoreData(): Load all of information in Core Data to class variables for use.
  
- AutonomousViewController: Viewcontroller class for Autonomous view, when in stage 1 of the game.
  + duck_delivered_change(), parking_alliance_storage_unit_change(), parking_storage_unit_change(), parking_warehouse(), completely_in_warehouse_change(), freight_storage_unit_change(), freight_shipping_hub_change(), duck_used_change(), team_scoring_elem_used_change() 
  + All of these function are used when a switch's state is changed. Each function represent each switch.

- DriverControlledViewController: Viewcontroller class for DriverControlled view, when in stage 2 of the game.
  + freight_change(), feight_l1_change(), freight_l2_change(), freight_l3_change(), shared_hub_freight_change()
  + Same with stage 1, they are used when a stepper's state is changed. Each function represent each switch.
  
- EndGameViewController: Viewcontroller class for EndGame view, when in last stage of the game.
  + ducks_delivered_change(), shared_hub_tipped_change(), shipping_hub_balanced_change(), shipping_hub_capped_change(), end_parking_warehouse_change(), end_completely_in_warehouse_change()
  + Same with stage 1, they are used when a switch's or stepper's state is changed. Each function represent each switch/stepper.

- ScoreViewController: ViewController for Score view, when showing the final score of a game.
  + calculate_autonomous(), calculate_driver_controlled(), calculate_endgame(): Calculate score for each stage.
  + submit_score(): When user click to "Submit Score" button. Only available when user choose to share the score when create the team.
  + locationManager(): Take current location of user.
  + Saving_game_info(): When user want to save game info (If they don't want to, they can choose to go back)

- RegisterViewController: Viewcontroller for Register view, when user want to register a new team.
  + textFieldShouldReturn(): Override standard function. Execute when user touch Return button.
  + touchesBegan(): Override standard function. Execute when user touch anywhere in screen.
  + OpenCameraRoll(): When user click on "Upload" image to upload, it execute to allow user select image from camera roll.
  + imagePickerController(): Override standard function. Execute when user don't want to pick up picture (Click "Cancel")
  + AddTeam(): When user click button to register new team, check if the info is valid, if valid, add new team to core data. 

- HighScoreViewController: ViewController class for high score list that retrieved from API
  + tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath): Override standard function. Execute when click on a row in table view.
  + tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int: Override standard function. Decides number of rows of a table view.
  + tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell: Override standard function. Used to load data to each cell.
  + searchBar(_ searchBar: UISearchBar, textDidChange searchText: String): Override standard function. Used to take actions when typing in search bar.
  + searchBarCancelButtonClicked(_ searchBar: UISearchBar): Override standard function. Execute when user cancel searching (Click "Cancel")
  + touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?): Override standard function. Execute when user touch anywhere.

- HighScoreTableViewCell: Represent for each cell in the high score table view. (Actually, I didn't do anything with this one)
  
- HighScoreTeamViewController: Represent for a team that is selected from high score list.
  + check_profile(): Change user location based on the difference between location from high score list and team list retrieved from API.
  
- RegisteredTeamsViewController: ViewController class for Registered teams view, show all teams that are registered already
  + tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath): Override standard function. Execute when click on a row in table view.
  + tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int: Override standard function. Used to decide the number of rows of the table view.
  + tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell: Override standard function. Used to define cell content.
  + searchBar(_ searchBar: UISearchBar, textDidChange searchText: String): Override standard function. Execute when user type something on search bar (whenever there's any change) to search for team ID.
  + searchBarCancelButtonClicked(_ searchBar: UISearchBar): Override standard function. Execute when user cancel searching (Click "Cancel"). 
  + touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?): Override standard function. Execute when user click somewhere else that's not in the text field of the search bar.
  
- TeamProfilesViewController: ViewController class for team profiles view, show all teams that are registered already with their record.
  + tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath): Override standard function. Execute when click on a row in table view.
  + tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int: Override standard function. Used to decide the number of rows of the table view.
  + tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell: Override standard function. Used to set content for each cell/row.
  + searchBar(_ searchBar: UISearchBar, textDidChange searchText: String): Override standard function. Executed when there's any change on the search bar (User typing), allow user to search for team ID.
  + searchBarCancelButtonClicked(_ searchBar: UISearchBar): Override standard function. Executed when user cancel searching (Click "Cancel")
  + touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?): Override standard function. Executed when user click somewhere else
  
- TeamProfileViewController: ViewController class for a team profile view, show selected team profile on all team profile
  + tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath): Override standard function. Execute when click on a row in table view.
  + tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int: Override standard function. Used to decide the number of rows of the table view.
  + tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat: Override standard function. used to decide the height of each cell (So I can write more details to each cell).
  + tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell: Override standard function. Used to set content for each cell/row.
