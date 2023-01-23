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
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(UIColor.white, for: .normal)
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        return setStatusButton
    }()
    
    private var statusTextField = UITextField()
    
    private var statusText = "hello"
    
    func setupUI(){
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
        
        statusTextField.textColor = .black
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.delegate = self
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.placeholder = "Write your status"
        statusTextField.clearButtonMode = .whileEditing
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.becomeFirstResponder()
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 30),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 25),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 100),
        
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 30),
            statusLabel.heightAnchor.constraint(equalToConstant: 25),
            statusLabel.widthAnchor.constraint(equalToConstant: 200),
            
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.heightAnchor.constraint(equalToConstant: 30),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -4),
            statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 30)
        ])
    }
    func addTarget(){
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    @objc func statusTextChanged(){
        statusText = statusTextField.text!
    }
    @objc func buttonPressed(){
        statusLabel.text = statusText
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
extension ProfileHeaderView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusTextField.resignFirstResponder()
        return true
    }
}


