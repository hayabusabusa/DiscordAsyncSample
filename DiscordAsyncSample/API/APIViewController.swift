//
//  APIViewController.swift
//  DiscordAsyncSample
//
//  Created by Yamada Shunya on 2019/09/30.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

final class APIViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var dataStore: [Post] = [Post]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getPosts()
    }
}

// MARK: - Setup UI

extension APIViewController {
    
    func setupUI() {
        // - Navigation
        navigationItem.title = "API"
        
        // - Indicator
        indicatorView.isHidden = true
        indicatorView.stopAnimating()
        
        // - TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        tableView.rowHeight = APITableViewCell.rowHeight
        tableView.register(APITableViewCell.nib, forCellReuseIdentifier: APITableViewCell.reuseIdentifier)
    }
}

// MARK: - API

extension APIViewController {
    
    func getPosts() {
        let client = JsonPlaceholderAPIClient("https://jsonplaceholder.typicode.com/posts")
        
        indicatorView.isHidden = false
        indicatorView.startAnimating()
        
        client.getPosts { [weak self] (posts, error) in
            if let error = error {
                print(error)
            }
            if let posts = posts {
                DispatchQueue.main.async {
                    self?.indicatorView.isHidden = true
                    self?.indicatorView.stopAnimating()
                    self?.dataStore = posts
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - TableView dataSource, delegate

extension APIViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: APITableViewCell.reuseIdentifier, for: indexPath) as! APITableViewCell
        cell.setupCell(dataStore[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
