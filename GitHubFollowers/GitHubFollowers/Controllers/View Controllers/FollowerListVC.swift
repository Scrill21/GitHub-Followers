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
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Methods
    

}//End of class
