//
//  APITableViewCell.swift
//  DiscordAsyncSample
//
//  Created by Yamada Shunya on 2019/09/30.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

class APITableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    
    // MARK: - Properties
    
    static let reuseIdentifier = "APITableViewCell"
    static let rowHeight: CGFloat = 88
    static var nib: UINib {
        return UINib(nibName: "APITableViewCell", bundle: nil)
    }
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setup UI
    
    func setupCell(_ post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
        idLabel.text = "ID: \(post.id)"
    }
}
