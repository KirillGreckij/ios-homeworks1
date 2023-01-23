//
//  PostViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 07.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Post"
        BarButtonAdd ()
    }
    func BarButtonAdd () {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(action))
    }
    @objc func action (){
        let exampleController = InfoViewController()
        navigationController?.present(exampleController, animated: true)
    }
}
