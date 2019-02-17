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
    @IBOutlet var rateButtons: [UIButton]!
    @IBOutlet var closeButton: UIButton!
    
    var restaurant: RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurantImage = restaurant.image {
            backgroundImageView.image = UIImage(data: restaurantImage as Data)
        }
        
        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveeScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        let moveTopTransform = CGAffineTransform.init(translationX: 0, y: -600)
        closeButton.alpha = 0
        closeButton.transform = moveTopTransform
        
        // Make the button invisible
        for rateButton in rateButtons {
            rateButton.transform = moveeScaleTransform
            rateButton.alpha = 0
        }
        
        // Close button animatiom
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var step = 0.1
        for button in self.rateButtons {
            UIView.animate(withDuration: 0.4, delay: step , usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: [], animations: {
                button.alpha = 1.0
                button.transform = .identity
            }, completion: nil)
            step += 0.05
            
            UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
                self.closeButton.alpha = 1.0
                self.closeButton.transform = .identity
            }, completion: nil)
        }
    }
    
}
