//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import FirebaseDatabase

public class DatabaseManager {
  
  static let shared = DatabaseManager()
  private let database = Database.database().reference()

  /// Store information of user to database 
  public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
    completion(true)
  }
  
  /// Store information of user to database
  public func storeNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
    database.child(email.safeDatabaseKey()).setValue(["username" : username]) { error, _ in
      if error == nil {
        completion(true)
        return
      } else {
        completion(false)
        return
      }
    }
  }
  
}
