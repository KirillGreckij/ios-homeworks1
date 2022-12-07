//
//  PostViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 07.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    var dataSource = Post(title: "Post")
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "First Text"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupConstraints() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setupConstraints()
        titleLabel.text = dataSource.title
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtomItem))
        navigationItem.rightBarButtonItem = myButton
    }
    @objc func barButtomItem(){
        let example = InfoViewController()
        navigationController?.pushViewController(example, animated: true)
    }
}
