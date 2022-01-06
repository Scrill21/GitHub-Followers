//
//  GFFollowItemVC.swift
//  GitHubFollowers
//
//  Created by anthony byrd on 1/4/22.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    //MARK: - UIConfiguration
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroudColor: .systemGreen, title: "Get Followers")
    }
}
