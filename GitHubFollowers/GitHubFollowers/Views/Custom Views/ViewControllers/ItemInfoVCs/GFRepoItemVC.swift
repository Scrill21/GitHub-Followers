//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by anthony byrd on 1/4/22.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    //MARK: - Properties
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    //MARK: - Methods
    
    //MARK: - UIConfiguration
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroudColor: .systemPurple, title: "GitHub Profile")
    }
}//End of class
