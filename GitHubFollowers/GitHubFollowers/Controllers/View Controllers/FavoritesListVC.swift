//
//  FavoritesListVC.swift
//  GitHubFollowers
//
//  Created by anthony byrd on 11/21/21.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        PersistanceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}//End of class
