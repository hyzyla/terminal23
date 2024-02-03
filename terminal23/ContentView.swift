import SwiftUI

struct ListHeader: View {
  var body: some View {
    HStack {
      Image(systemName: "airplane.departure")
      Text("Terminal B").font(.largeTitle)
    }
  }
}

struct ContentView: View {

  let blogs: [Blog] = [
    Blog(
      id: UUID(), name: "Українські Кулінарні Традиції",
      posts: [

        Post(
          id: UUID(), title: "Топ-5 традиційних українських страв",
          content:
            "Українська кухня славиться своєю різноманітністю та смачними стравами. У цій статті ми розглянемо топ-5 традиційних українських страв, які варто спробувати...",
          lastUpdated: Date().addingTimeInterval(-60000)),
        Post(
          id: UUID(), title: "Секрети приготування борщу",
          content:
            "Борщ - одна з найвідоміших та найулюбленіших страв української кухні. У цій статті ми поділимося секретами його приготування...",
          lastUpdated: Date().addingTimeInterval(-30000)),
      ]),
    Blog(
      id: UUID(), name: "Еко-туризм в Україні",
      posts: [
        Post(
          id: UUID(), title: "Найкращі місця для еко-туризму в Україні",
          content:
            "Еко-туризм стає все більш популярним у світі. Україна може запропонувати чимало цікавих місць для любителів природи та активного відпочинку. У цій статті ми розглянемо найкращі з них...",
          lastUpdated: Date().addingTimeInterval(-12000))
      ]),
  ]

  var body: some View {
    NavigationView {
      List(blogs) { blog in
        ZStack(alignment: .leading) {
          HStack {
            Image(systemName: "person.circle.fill")
              .resizable()
              .frame(width: 50, height: 50)
              .clipShape(Circle())
            VStack(alignment: .leading, spacing: 5) {
              HStack {
                Text(blog.name)
                  .font(.headline)
                  .lineLimit(1)
                Spacer()
                if let lastPost = blog.posts.last {
                  Text("\(lastPost.lastUpdated, formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
              }
              if let lastPost = blog.posts.last {
                Text(lastPost.content)
                  .font(.subheadline)
                  .foregroundColor(.secondary)
                  .lineLimit(2)
              }

            }
          }
          // Trick to remove "disclosure" button
          NavigationLink(destination: BlogDetailView(blog: blog)) {
            EmptyView()
          }
          .opacity(0.0)
        }
        .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
      }
      .frame(maxWidth: .infinity)
      .edgesIgnoringSafeArea(.horizontal)
      .listStyle(.grouped)
      .padding(.top, -25)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          HStack(spacing: 15) {
            Image(systemName: "airplane.departure")
            Text("Terminal 23").font(.title).fontWeight(.bold)
          }
        }
      }
    }
  }

  var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    formatter.locale = Locale(identifier: "uk_UA")
    return formatter
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
