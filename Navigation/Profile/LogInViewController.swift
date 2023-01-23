//
//  LogInViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 23.01.2023.
//

import UIKit

class LogInViewController: UIViewController {
    private lazy var scrollView = UIScrollView()
    private lazy var stackView = UIStackView()
    private lazy var logo = UIImageView()
    private lazy var loginTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var button = UIButton()
    private var login: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        setupUI()
        setupConstraint()
        setupGestures()
    }
    func setupUI(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.cornerRadius = 10
        loginTextField.textColor = .black
        loginTextField.font = .systemFont(ofSize: 16)
        loginTextField.autocapitalizationType = .none
        loginTextField.backgroundColor = .systemGray6
        loginTextField.tag = 0
        loginTextField.placeholder = "Введите логин"
        loginTextField.keyboardType = .emailAddress
        loginTextField.clearButtonMode = .whileEditing
        //loginTextField.delegate = self
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.tag = 1
        passwordTextField.returnKeyType = .done
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.isSecureTextEntry = true
        //passwordTextField.delegate = self
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //button.backgroundColor = .systemBlue
        button.setTitle("Log in", for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    func setupConstraint(){
        view.addSubview(scrollView)
        scrollView.addSubview(self.logo)
        scrollView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.loginTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        self.stackView.addArrangedSubview(self.button)
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.logo.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            self.logo.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.logo.heightAnchor.constraint(equalToConstant: 100),
            self.logo.widthAnchor.constraint(equalToConstant: 100),
            
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 340),
            self.stackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.stackView.heightAnchor.constraint(equalToConstant: 170),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
            
        ])
    }
    
    @objc func action(){
        let exampleController = ProfileViewController()
        navigationController?.pushViewController(exampleController, animated: true)
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY = self.stackView.frame.origin.y + self.button.frame.origin.y + self.button.frame.height // self.button.frame.origin.y - положение относительно супервью - self.stackView - поэтому прибавляем положение стека.
            let keyboardOriginY = self.view.frame.height - keyboardHeight

            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0

            print("🍋 \(self.stackView.frame.origin.y), \(self.loginTextField.frame.origin.y), \(self.button.frame.origin.y)")

            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }
}


extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("🍏 \(textField.text)")
        if textField.tag == 0 {
            self.login = textField.text
        } else if textField.tag == 1 {
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
}
