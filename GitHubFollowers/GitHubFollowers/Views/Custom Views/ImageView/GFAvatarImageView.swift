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
    let cache = NetworkManager.shared.cache
    
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
    
    func downloadImage(from urlString: String) {
        let casheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: casheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if error != nil { return }
            
            if let response = response as? HTTPURLResponse { print("DOWNLOAD IMAGE CODE: \(response.statusCode)") }
            
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: casheKey)
            
            DispatchQueue.main.async { self.image = image }
        }
        task.resume()
    }
}
