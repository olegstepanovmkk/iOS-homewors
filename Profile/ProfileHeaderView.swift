//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Oleg Stepanov on 29.03.2026.
//

// ProfileViewController.swift


import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let showStatusButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        
        // === АВАТАРКА ===
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor

        // Здесь добавляем нашу картинку
        avatarImageView.image = UIImage(named: "hipstercat")          // ← наша новая картинка
                             ?? UIImage(named: "Lesson_4_Layout_1")
                             ?? UIImage(named: "Lesson_4_Layout_1.png")
                             ?? UIImage(systemName: "person.circle.fill")

        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(avatarImageView)
        
        // Имя
        nameLabel.text = "Hipster Cat"
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        // Статус
        statusLabel.text = "Waiting for something..."
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.textAlignment = .left
        statusLabel.numberOfLines = 0
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statusLabel)
        
        // Кнопка
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(showStatusButton)
        
        // Тень кнопки по твоему макету
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOpacity = 0.7
        
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        setupConstraints()
    }
    
   
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // 1. Аватарка слева
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            
            // 2. Имя — справа от аватарки (на уровне аватарки)
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            // 3. Статус — под именем, справа от аватарки
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 34),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34),
            
            // 4. Кнопка — ниже всего
            showStatusButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 34),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
    
    @objc private func buttonPressed() {
        print("Статус: \(statusLabel.text ?? "нет статуса")")
    }
}



