//
//  JsonPlaceholderAPIClient.swift
//  DiscordAsyncSample
//
//  Created by Yamada Shunya on 2019/09/30.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import Foundation

struct JsonPlaceholderAPIClient {
    
    private let baseUrl: String
    
    init(_ baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getPosts(completion: @escaping ((_ posts: [Post]?, _ error: Error?) -> Void)) {
        if let url = URL(string: baseUrl) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                }

                if let response = response as? HTTPURLResponse,
                    let data = data {
                    if response.statusCode == 200 {
                        do {
                            let posts = try JSONDecoder().decode([Post].self, from: data)
                            completion(posts, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, NSError(domain: "API Error Code=\(response.statusCode)", code: response.statusCode, userInfo: nil))
                    }
                } else {
                    // Response empty
                    completion(nil, nil)
                }
            }.resume()
        }
    }
}
