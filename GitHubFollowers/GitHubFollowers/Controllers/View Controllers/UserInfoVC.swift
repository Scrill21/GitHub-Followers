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
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.localizedDescription, buttonTitle: "Ok")
            }
        }
    }
    
    //MARK: - Methods
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    //MARK: - UI Configuration
}
