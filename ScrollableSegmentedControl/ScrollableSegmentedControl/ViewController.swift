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
        let segmentedControl = UISegmentedControl(items: items)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: .zero, height: 50)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(segmentedControl)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 50),
            
            segmentedControl.topAnchor.constraint(equalTo: scrollView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
}

extension UIButton {
    func createSegmentedControlButton(setTitle to: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(to, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 90).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.backgroundColor = UIColor.init(white: 0.1, alpha: 0.1)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }
}

