//
//  Blog.swift
//  terminal23
//
//  Created by Yevhenii Hyzyla on 22.04.2023.
//

import Foundation

struct Blog: Identifiable {
  let id: UUID
  let name: String
  let posts: [Post] 
}
