//
//  UserDefaultsExtensions.swift
//  Rocket.Chat
//
//  Created by Rafael Kellermann Streit on 12/18/17.
//  Copyright © 2017 Rocket.Chat. All rights reserved.
//

import Foundation

extension UserDefaults {

    static var sharedContainer: UserDefaults? {
        return UserDefaults(suiteName: kBundleSharedGroup)
    }

}
