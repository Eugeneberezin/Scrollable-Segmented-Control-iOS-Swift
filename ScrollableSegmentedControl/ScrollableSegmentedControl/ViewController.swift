//
//  ViewController.swift
//  ScrollableSegmentedControl
//
//  Created by Eugene Berezin on 4/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    let items  = ["All Fruits", "Orange", "Grapes", "Banana",  "Mango", "papaya", "coconut", "django"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollableSegmentedControl()
    }
    
    func configureScrollableSegmentedControl() {
        let segmentedControl = UISegmentedControl(items: [])
        
    }

}

