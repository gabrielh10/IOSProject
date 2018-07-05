//
//  ProfileViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/28/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var loggedUser = Profile(id: 0, name: "", company: "", place: "", job: "", knowledge: [])
//    var loggedUser : Profile
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var numberOfAnswers: UILabel!
    @IBOutlet weak var numberOfComunities: UILabel!
    
    @IBOutlet weak var profileComunitiesTableView: UITableView!
    override func viewDidLoad() {
        profileComunitiesTableView.delegate = self
        profileComunitiesTableView.dataSource = self
        
        super.viewDidLoad()
        var profiles:[Profile] = []
       
        
        if let savedProfiles = UsingDefaults.loadFromDefaults(key: "profiles", objType: [Profile].self) as? [Profile]{
            profiles = savedProfiles
        }
 
        if let savedUser = UsingDefaults.loadFromDefaults(key: "loggedUser", objType: Profile.self) as? Profile{
            loggedUser = savedUser
            print("äqui")
        }
    
        UsingDefaults.saveToDefaults(key: "loggedUser", obj: loggedUser)
        // Do any additional setup after loading the view.
        name.text = loggedUser.name
        company.text = loggedUser.place
        job.text = loggedUser.job + " @ " + loggedUser.company
        numberOfComunities.text = String(loggedUser.comunities.count) + " Comunidades"
 
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(loggedUser.comunities.count)
        return loggedUser.comunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("äqui")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileComunitiesCell", for: indexPath) as! ProfileComunitiesTableViewCell
        cell.startupName.text = loggedUser.comunities[indexPath.row].name
        cell.numberOfMembers.text = String(loggedUser.comunities[indexPath.row].quantity) + " Members"
        cell.numberOfQuestions.text = String(0) + " Perguntas"
        print("na table view", loggedUser.name)
        return cell
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    //    name.text = loggedUser
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
