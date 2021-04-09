//
//  ViewController.swift
//  ScrollableSegmentedControl
//
//  Created by Eugene Berezin on 4/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    let items  = ["All Fruits", "Orange", "Grapes", "Banana",  "Mango", "papaya", "coconut", "django"]
    let allFruits = UIButton().createSegmentedControlButton(setTitle: "All Fruits")
    let orange = UIButton().createSegmentedControlButton(setTitle: "Orange")
    let grapes = UIButton().createSegmentedControlButton(setTitle: "Grapes")

    let banana = UIButton().createSegmentedControlButton(setTitle: "Banana")
    
    let mango = UIButton().createSegmentedControlButton(setTitle: "Mango")
    
    let papaya = UIButton().createSegmentedControlButton(setTitle: "Papaya")
    
    let coconut = UIButton().createSegmentedControlButton(setTitle: "coconut")
    
    let django = UIButton().createSegmentedControlButton(setTitle: "django")
    
    let segmentedControlBackgroundColor = UIColor.init(white: 0.1, alpha: 0.1)
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCustomSegmentedControl()
    }
    
    @objc func handleSegmentedControlButtons(sender: UIButton) {
        let segmentedControlButtons: [UIButton] = [
            allFruits,
            orange,
            banana,
            mango,
            papaya,
            coconut,
            django,
            grapes
        ]
        
        for button in segmentedControlButtons {
            if button == sender {
                UIView.animate(withDuration: 0.2, delay: 0.1, options: .transitionFlipFromLeft) {
                    button.backgroundColor = .white
                }

            } else {
                UIView.animate(withDuration: 0.2, delay: 0.1, options: .transitionFlipFromLeft) { [weak self] in
                    button.backgroundColor = self?.segmentedControlBackgroundColor
                }
            }
        }
        
    }
    
    func configureCustomSegmentedControl() {
        let segmentedControlButtons: [UIButton] = [
            allFruits,
            orange,
            banana,
            mango,
            papaya,
            coconut,
            django,
            grapes
        ]
        
        segmentedControlButtons.forEach {$0.addTarget(self, action: #selector(handleSegmentedControlButtons(sender:)), for: .touchUpInside)}
        
        let stackView = UIStackView(arrangedSubviews: segmentedControlButtons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: .zero, height: 50)
        scrollView.backgroundColor = segmentedControlBackgroundColor
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(stackView)
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
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

