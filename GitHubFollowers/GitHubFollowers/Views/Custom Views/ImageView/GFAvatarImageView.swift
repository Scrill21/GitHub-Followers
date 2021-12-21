//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by anthony byrd on 12/19/21.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    //MARK: - Properties
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    //MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - UI Configuration
    
}
