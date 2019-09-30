//
//  Post.swift
//  DiscordAsyncSample
//
//  Created by Yamada Shunya on 2019/09/30.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
}
