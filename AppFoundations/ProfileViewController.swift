//
//  ProfileViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 6/28/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var numberOfAnswers: UILabel!
    @IBOutlet weak var numberOfComunities: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var profiles:[Profile] = []
        
        if let savedProfiles = UsingDefaults.loadFromDefaults(key: "profiles", objType: [Profile].self) as? [Profile]{
            profiles = savedProfiles
        }
        
        var loggedUser:Profile = profiles[0]
        if let savedUser = UsingDefaults.loadFromDefaults(key: "loggedUser", objType: Profile.self) as? Profile{
            loggedUser = savedUser
        }
        UsingDefaults.saveToDefaults(key: "loggedUser", obj: loggedUser)
        // Do any additional setup after loading the view.
        name.text = loggedUser.name
        company.text = loggedUser.place
        job.text = loggedUser.job + " @ " + loggedUser.company
        numberOfComunities.text = String(loggedUser.comunities.count) + " Comunidades"
        
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
