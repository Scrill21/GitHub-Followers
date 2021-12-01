//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by anthony byrd on 11/21/21.
//

import UIKit

class FollowerListVC: UIViewController {
    //MARK: - Properties
    var username: String!
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: - Methods
    

}//End of class
