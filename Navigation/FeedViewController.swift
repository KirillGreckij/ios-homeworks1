//
//  FeedViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 07.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var stackView = UIStackView()
    private var firstButton = UIButton()
    private var secondButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Feed"
        setupUI()
        constraintsUI()
    }
    func setupUI(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.backgroundColor = .red
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        firstButton.setTitle("First button", for: .normal)
        firstButton.setTitleColor(UIColor.black, for: .normal)
        firstButton.backgroundColor = .red
        firstButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        
        secondButton.setTitle("Second button", for: .normal)
        secondButton.setTitleColor(UIColor.black, for: .normal)
        secondButton.backgroundColor = .red
        secondButton.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    func constraintsUI(){
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    @objc func action (){
        let exampleController = PostViewController()
        navigationController?.pushViewController(exampleController, animated: true)
    }
}
