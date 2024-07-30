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

public enum UserPostType {
  case photo, video
}

public struct UserPost {
  let id: String
  let postType: UserPostType
  let thumbnailImg: URL
  let postURL: URL
  let caption: String?
  let likes: [PostLike]
  let comments: [PostComment]
  let createdDate: Date
}

struct PostLike {
  let username: String
  let postId: String
}


struct PostComment {
  let id: String
  let username: String
  let text: String
  let createdDate: Date
  let like: [CommentLike]
}

struct CommentLike {
  let username: String
  let commentId: String
}
