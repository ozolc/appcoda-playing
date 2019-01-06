//
//  ViewController.swift
//  PathsNLayers
//
//  Created by Maksim Nosov on 06/01/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
        
        let demoView = DemoView(frame: CGRect(x: self.view.frame.width / 2 - width / 2,
                                              y: self.view.frame.height / 2 - height / 2,
                                              width: width,
                                              height: height))
        self.view.addSubview(demoView)
    }


}

