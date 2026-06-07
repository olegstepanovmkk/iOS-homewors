//
//  PostViewController.swift
//  Navigation
//
//  Created by Oleg Stepanov on 22.03.2026.
//


import Foundation

//
//  Post.swift
//  Navigation
//
//  Created by Oleg Stepanov
//

import Foundation

struct Post {
    let title: String
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

import UIKit

class PostViewController: UIViewController {
    
    var receivedPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint.withAlphaComponent(0.2)
        
        title = receivedPost?.title ?? "Пост"
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Инфо",
            style: .plain,
            target: self,
            action: #selector(showInfo)
        )
    }
    
    @objc private func showInfo() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
