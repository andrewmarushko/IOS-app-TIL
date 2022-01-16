import Foundation

final class CreateUserData: Codable {
  var id: UUID?
  var name: String
  var username: String
  var password: String?

  init(name: String, username: String, password: String) {
    self.name = name
    self.username = username
    self.password = password
  }
}
