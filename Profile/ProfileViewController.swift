//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Oleg Stepanov on 29.03.2026.
//



import UIKit

class ProfileViewController: UIViewController {
    
    private let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 320)   // ← оптимальная высота
        ])
    }
}
