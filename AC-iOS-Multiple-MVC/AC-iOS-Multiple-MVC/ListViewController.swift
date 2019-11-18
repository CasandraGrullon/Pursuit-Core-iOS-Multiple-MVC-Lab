//
//  ListViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by casandra grullon on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var animalData = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalData = ZooAnimal.getSections()
        tableView.delegate = self
        tableView.dataSource = self
        print(animalData.count)
        
    }
//prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? AnimalDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("check your prepare for segue")
        }
        detailVC.animalDeets = animalData[indexPath.section][indexPath.row]
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalData[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalTableViewCell else {
            fatalError("cell not working")
        }
        
        let animal = animalData[indexPath.section][indexPath.row]
        
        cell.animalStats(for: animal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalData[section].first?.classification
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalData.count
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
    
}
