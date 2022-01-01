//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by anthony byrd on 12/30/21.
//

import UIKit

class UserInfoVC: UIViewController {
    
    //MARK: - Properties
    var username: String!
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    //MARK: - Methods
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    //MARK: - UI Configuration
}
