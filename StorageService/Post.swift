//
//  Post.swift
//  StorageService
//
//  Created by Oleg Stepanov on 19.04.2026.
//

import Foundation

public struct Post {
    public let id: String
    public let text: String
    
    public init(id: String, text: String) {
        self.id = id
        self.text = text
    }
}
