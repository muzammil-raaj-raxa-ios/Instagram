//
//  StorageManager.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import FirebaseStorage

public class StorageManager {
  
  static let shared = StorageManager()

  private let bucket = Storage.storage().reference()
  
  public enum StorageManagerError: Error {
    case failedToDownload
  }
  
  public func uploadUsersPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
    
  }
  
  public func downloadImage(with reference: String, completion: @escaping (Result<URL, StorageManagerError>) -> Void) {
    bucket.child(reference).downloadURL { url, error in
      guard let url = url, error == nil else {
        completion(.failure(.failedToDownload))
        return
      }
      
      completion(.success(url))
    }
  }
  
}

public struct UserPost {
  let postType: UserPostType
}

public enum UserPostType {
  case photo, video
}
