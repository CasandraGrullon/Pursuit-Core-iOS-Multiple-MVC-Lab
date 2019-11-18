//
//  AnimalDetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by casandra grullon on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {

    @IBOutlet weak var animalDetailImage: UIImageView!
    
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    var animalDeets: ZooAnimal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
           guard let selectedAnimal = animalDeets else {
               fatalError("couldn't get a country value, verify prepare for segue")
           }
           //title is a property of viewController
        let image = String(animalDeets?.imageNumber ?? 1)
        title = animalDeets?.name
        animalDetailImage.image = UIImage(named: image)
        animalDescriptionLabel.text = animalDeets?.info
       }

}
