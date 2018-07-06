//
//  ComunitiesViewController.swift
//  AppFoundations
//
//  Created by Gabriel Henrique Daniel da Silva on 7/3/18.
//  Copyright © 2018 Gabriel Henrique Daniel da Silva. All rights reserved.
//

import UIKit

class ComunitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var comunities:[Comunity] = []
    var comunitiesImages:[UIImage] = [UIImage(named:"manguezal")!, UIImage(named:"startuprio")!, UIImage(named:"startup_pe")!, UIImage(named:"sc")!, UIImage(named:"desafios_financeiros")!, UIImage(named:"cin")!, UIImage(named:"marketing_digital")!]
    var comunitiesDescript:[String] = ["Comunidade de startups do Mangue Recifense","Comunidade de startups do Rio de Janeiro","Comunidade de Startups de Pernambuco","Comunidade de Startups de Santa Catarina","Comunidade para CFOs","Comunidade de startups do CIn-UFPE","Comunidade de CMOs"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComunityCell", for: indexPath) as! ComunitiesTableViewCell
        cell.comunityName.text = comunities[indexPath.row].name
        cell.comunityDescription.text = comunitiesDescript[indexPath.row]
        cell.comunityImage.image = comunitiesImages[indexPath.row]
        cell.numberOfMembers.text = String(comunities[indexPath.row].quantity) + " Membros"
        cell.numberOfQuestions.text = "200"
      //  cell.comunityImage.image = 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    @IBOutlet weak var comunitiesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        comunitiesTableView.delegate = self
        comunitiesTableView.dataSource = self
        // Do any additional setup after loading the view.
        if let savedComunities = UsingDefaults.loadFromDefaults(key: "comunities", objType: [Comunity].self) as? [Comunity]{
            comunities = savedComunities
        }
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
