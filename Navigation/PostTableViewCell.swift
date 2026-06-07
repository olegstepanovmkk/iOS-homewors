//
//  PostTableViewCell.swift
//  Navigation
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - UI Elements
    private let authorImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        iv.backgroundColor = .systemGray5
        return iv
    }()
    
    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemGray6
        return iv
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .systemRed
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .systemGray
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .systemBackground
        
        let topStack = UIStackView(arrangedSubviews: [authorImageView, authorNameLabel])
        topStack.axis = .horizontal
        topStack.spacing = 12
        topStack.alignment = .center
        
        let bottomStack = UIStackView(arrangedSubviews: [likesLabel, viewsLabel])
        bottomStack.axis = .horizontal
        bottomStack.distribution = .fillEqually
        
        let mainStack = UIStackView(arrangedSubviews: [topStack, postImageView, descriptionLabel, bottomStack])
        mainStack.axis = .vertical
        mainStack.spacing = 10
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            authorImageView.widthAnchor.constraint(equalToConstant: 40),
            authorImageView.heightAnchor.constraint(equalToConstant: 40),
            
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 0.9) // почти квадрат
        ])
    }
    
    // MARK: - Configure
    func configure(with post: Post) {
        authorNameLabel.text = post.author
        descriptionLabel.text = post.description
        likesLabel.text = "❤️ \(post.likes)"
        viewsLabel.text = "👁 \(post.views)"
        
        // Можно добавить разные аватарки позже
        authorImageView.image = UIImage(named: "avatar") ?? UIImage(systemName: "person.circle.fill")
        postImageView.image = UIImage(named: post.image)
    }
}
