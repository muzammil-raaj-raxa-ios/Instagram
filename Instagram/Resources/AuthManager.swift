//
//  AuthManager.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import FirebaseAuth

public class AuthManager {
  
  static let shared = AuthManager()
  
  public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
     
    DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
      if canCreate {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
          guard error == nil, result != nil else {
            completion(false)
            return
          }
          DatabaseManager.shared.storeNewUser(with: email, username: username) { stored in
            if stored {
              completion(true)
              return
            } else {
              completion(false)
              return
            }
          }
        }
      } else {
        completion(false)
      }
    }
  }
  
  
  
  public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
    if let email = email {
      Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        guard authResult != nil, error != nil else {
          completion(false)
          return
        }
        
        completion(true)
      }
    } else if let username = username {
      print(username)
    }
  }
}
