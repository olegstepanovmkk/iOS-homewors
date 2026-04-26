//
//  StorageService.swift
//  StorageService
//
//  Created by Oleg Stepanov on 19.04.2026.
//

import Foundation

public class StorageManager {          // ← Изменили имя класса
    
    public static let shared = StorageManager()
    private init() {}
    
    private var posts: [Post] = []
    
    public func savePost(_ post: Post) {
        posts.append(post)
        print("✅ Пост сохранён: \(post.text)")
    }
    
    public func getAllPosts() -> [Post] {
        return posts
    }
}
