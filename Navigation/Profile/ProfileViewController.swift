//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Oleg Stepanov
//

import UIKit

class ProfileViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private var posts: [Post] = [
        Post(title: "Пост 1",
             author: "hipster_cat",
             description: "Какой прекрасный день для кодинга! ☀️",
             image: "post1",
             likes: 124,
             views: 845),
        
        Post(title: "Пост 2",
             author: "swift_lover",
             description: "Auto Layout — это любовь ❤️",
             image: "post2",
             likes: 89,
             views: 623),
        
        Post(title: "Пост 3",
             author: "ios_dev",
             description: "UITableView — мощный инструмент",
             image: "post3",
             likes: 215,
             views: 1340),
        
        Post(title: "Пост 4",
             author: "design_guru",
             description: "Сегодня экспериментировал с новыми шрифтами",
             image: "post4",
             likes: 67,
             views: 452)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemBackground
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Регистрируем ячейку
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        
        // Настройки таблицы
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 400
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableView DataSource & Delegate
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let post = posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    
    // MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        // header.configure(...) — если нужно
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}
