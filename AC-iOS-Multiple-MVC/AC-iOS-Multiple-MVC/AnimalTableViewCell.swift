//
//  AnimalTableViewCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by casandra grullon on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var animalThumbImage: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalOriginLabel: UILabel!

    func animalStats(for animal: ZooAnimal) {
        animalNameLabel.text = animal.name
        animalOriginLabel.text = animal.origin
        animalThumbImage.image = UIImage(named: String(animal.imageNumber))
    }
    
}
