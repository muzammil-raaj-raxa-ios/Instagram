//
//  Models.swift
//  Instagram
//
//  Created by Mag isb-10 on 31/07/2024.
//

import UIKit

public enum Gender {
  case male, female
}

struct User {
  let username: String
  let name: (first: String, last: String)
  let bio: String
  let birthDate: Date
  let gender: [Gender]
  let counts: UserCount
  let joinDate: Date
}

struct UserCount {
  let posts: Int
  let followers: Int
  let following: Int
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
  let taggedUser: [String]
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
