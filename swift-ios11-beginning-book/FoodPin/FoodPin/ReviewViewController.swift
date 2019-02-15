//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Maksim Nosov on 15/02/2019.
//  Copyright © 2019 NosovML. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)
    }

}
