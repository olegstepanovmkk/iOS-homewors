//
//  FeedViewController.swift
//  Navigation
//
//  Created by Oleg Stepanov on 22.03.2026.
//


import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Лента"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Открыть пост",
            style: .plain,
            target: self,
            action: #selector(openPost)
        )
    }
    
    @objc private func openPost() {
        // Пример исправления в FeedViewController
        let post = Post(
            title: "Пост из ленты",
            author: "netology",
            description: "Это пример поста из FeedViewController",
            image: "post1",           // убедись, что картинка есть в Assets
            likes: 42,
            views: 256
        )
        
        let postVC = PostViewController()
        postVC.receivedPost = post
        
        navigationController?.pushViewController(postVC, animated: true)
    }
}
