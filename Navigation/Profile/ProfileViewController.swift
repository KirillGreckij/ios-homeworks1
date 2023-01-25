//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 07.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private var newButton : UIButton = {
        let newButton = UIButton()
        newButton.setTitle("New Button", for: .normal)
        newButton.backgroundColor = .blue
        newButton.translatesAutoresizingMaskIntoConstraints = false
        return newButton
    }()
    
    private let profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupUI(){
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),

            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            newButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        setupUI()
    }
}
