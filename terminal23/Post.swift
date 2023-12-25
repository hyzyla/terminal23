//
//  Post.swift
//  terminal23
//
//  Created by Yevhenii Hyzyla on 22.04.2023.
//

import Foundation

struct Post: Identifiable {
  let id: UUID
  let title: String
  let content: String
  let lastUpdated: Date
}
