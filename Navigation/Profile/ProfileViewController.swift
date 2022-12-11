//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 07.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private var label : UILabel = {
        let view = UILabel()
        view.text = "Profile"
        view.frame = CGRect(x: 150, y: 20, width: 100, height: 100)
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 25.0)
        return view
    }()
    
    private let profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        return view
    }()
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = CGRect(x: 0, y: 100, width: 392, height: 730)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileHeaderView)
        view.backgroundColor = .white
        view.addSubview(label)
    }
}
