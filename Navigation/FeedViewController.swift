//
//  FeedViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 07.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    var dataSource = Post(title: "Feed view")
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "First Text"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.backgroundColor = .red
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("First button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .red
        return button
    }()

    private let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Second button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    func setupUI(){
        addTarget()
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        NSLayoutConstraint.activate([
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    }
    func addTarget() {
        firstButton.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(tapOnBlueButton), for: .touchUpInside)
    }
    
    @objc func tapOnBlueButton() {
        let exampleController = PostViewController()
        navigationController?.pushViewController(exampleController, animated: true)
    }
    func setupConstraints() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        setupUI()
        titleLabel.text = dataSource.title
    }
}
