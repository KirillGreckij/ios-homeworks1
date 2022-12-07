//
//  InfoViewController.swift
//  Navigation
//
//  Created by Кирилл Грецкий on 07.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    let alertController = UIAlertController(title: "Внимание", message: "Message", preferredStyle: .alert)
    
    
    func setupAlertConfiguration() {
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            print("first")
        }
        let secondAction = UIAlertAction(title: "Cancel", style: .default) {_ in
            print("second")
        }
        alertController.addAction(action)
        alertController.addAction(secondAction)
    }
    

    @objc func addTarget() {
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAlertConfiguration()
        let barItem = UIBarButtonItem(image: UIImage(systemName: "trash.circle"), style: .plain, target: self, action: #selector(addTarget))
        self.navigationItem.rightBarButtonItem = barItem
    }
}
