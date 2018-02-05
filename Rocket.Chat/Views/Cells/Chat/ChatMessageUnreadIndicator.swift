//
//  ChatMessageUnreadIndicator.swift
//  Rocket.Chat
//
//  Created by Luca Justin Zimmermann on 05/02/18.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import UIKit

final class ChatMessageUnreadIndicator: UICollectionViewCell {

    static let minimumHeight = CGFloat(40)
    static let identifier = "ChatMessageUnreadIndicator"

    @IBOutlet weak var labelTitle: UILabel!

}
