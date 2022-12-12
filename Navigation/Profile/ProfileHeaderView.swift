//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 12.12.2022.
//

import UIKit

class ProfileHeaderView: UIView{
    
    private var fullNameLabel : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "My profile"
        view.font = .systemFont(ofSize: 18.0, weight: .bold)
        return view
    }()
    
    private var statusLabel : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Waiting for something..."
        view.font = .systemFont(ofSize: 14.0, weight: .regular)
        view.textColor = .gray
        return view
    }()
    
    private var avatarImageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "kartinka")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        return view
    }()
    
    private var setStatusButton : UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Show status", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 4
        view.titleLabel?.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 4
        view.titleLabel?.shadowColor = .black
        view.layer.shadowOpacity = 0.7
        return view
    }()
    
    private var statusTextField : UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    func setupUI(){
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 30),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 25),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 30),
            statusLabel.heightAnchor.constraint(equalToConstant: 25),
            statusLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func addTarget() {
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed(){
        print("Статус")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        setupUI()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

