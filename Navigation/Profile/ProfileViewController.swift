//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 07.12.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    private var label : UILabel = {
        let view = UILabel()
        view.text = "Profile"
        view.frame = CGRect(x: 150, y: 20, width: 100, height: 100)
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 25.0)
        return view
    }()
    
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
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            newButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupUI()
    }
}
