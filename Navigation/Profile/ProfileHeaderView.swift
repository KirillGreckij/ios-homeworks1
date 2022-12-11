//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 11.12.2022.
//

import UIKit

class ProfileHeaderView : UIView {
    private var label : UILabel = {
       let view = UILabel()
        view.frame = CGRect(x: 150, y: 27, width: 100, height: 25)
        view.text = "My profile"
        view.font = .systemFont(ofSize: 18.0, weight: .bold)
        return view
    }()
    
    private var label1 : UILabel = {
       let view = UILabel()
        view.frame = CGRect(x: 150, y: 77, width: 200, height: 25)
        view.text = "Waiting for something..."
        view.font = .systemFont(ofSize: 14.0, weight: .regular)
        view.textColor = .gray
        return view
    }()
    
    private var image : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "kartinka")
        view.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
        return view
    }()
    
    private var button : UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 16, y: 132, width: 360, height: 50)
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
    
    func setupUI(){
        self.addSubview(image)
        self.addSubview(label)
        self.addSubview(label1)
        self.addSubview(button)
    }
    
    func addTarget() {
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
