//
//  BlogDetailView.swift
//  terminal23
//
//  Created by Yevhenii Hyzyla on 22.04.2023.
//

import MarkdownUI
import SwiftUI

struct BlogDetailView: View {
  let blog: Blog

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 20) {
        ForEach(blog.posts) { post in
          VStack(alignment: .leading) {
            Markdown(post.content)
              .markdownTextStyle(\.text) {
                FontSize(16)

              }
            Divider()
            HStack {
              Image(systemName: "bubble.left")
              Text("Залишити коментар")
              Spacer()
              Image(systemName: "chevron.right")
            }
            .foregroundColor(.blue)
          }
          .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
          )
          .padding()
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
          .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
              .stroke(Color.gray, lineWidth: 0.2)
          )

        }
      }
      .padding()
    }
    .navigationTitle(blog.name)
    .toolbar {
      ToolbarItemGroup(placement: .navigationBarTrailing) {

        Menu {
          Button(action: {}) {
            Label("Create a file", systemImage: "doc")
          }

          Button(action: {}) {
            Label("Create a folder", systemImage: "folder")
          }
        } label: {
          Label("Add", systemImage: "ellipsis.circle")
        }
      }
    }
    .background(
      Image("background")
        .resizable(resizingMode: .tile)
        .colorMultiply(.cyan)
        .opacity(0.5)
    )
  }
}

struct BlogDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BlogDetailView(
      blog: Blog(
        id: UUID(), name: "Українські Кулінарні Традиції",
        posts: [
          Post(
            id: UUID(), title: "Топ-5 традиційних українських страв",
            content:
              "Українська кухня славиться своєю різноманітністю та смачними стравами. У цій статті ми розглянемо топ-5 традиційних українських страв, які варто спробувати",
            lastUpdated: Date().addingTimeInterval(-60000)),
          Post(
            id: UUID(), title: "Секрети приготування борщу",
            content:
              "**Борщ**\n\nБорщ - одна з найвідоміших та найулюбленіших страв української кухні. У цій статті ми поділимося секретами його приготування",
            lastUpdated: Date().addingTimeInterval(-30000)),
        ])
    )
  }
}
