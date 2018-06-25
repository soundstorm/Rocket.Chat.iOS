//
//  SubscriptionsRequest.swift
//  Rocket.Chat
//
//  Created by Matheus Cardoso on 5/8/18.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import SwiftyJSON
import RealmSwift

struct SubscriptionsRequest: APIRequest {
    typealias APIResourceType = SubscriptionsResource
    let path = "/api/v1/subscriptions.get"
    let requiredVersion = Version(0, 60, 0)

    var query: String? {
        if let updatedSince = updatedSince {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            return "updatedSince=\(dateFormatter.string(from: updatedSince))"
        }

        return nil
    }

    let updatedSince: Date?

    init(updatedSince: Date? = nil) {
        self.updatedSince = updatedSince
    }
}

final class SubscriptionsResource: APIResource {
    var update: [Subscription]? {
        guard let realm = Realm.current else { return [] }
        return raw?["update"].array?.map {
            return Subscription.getOrCreate(realm: realm, values: $0, updates: nil)
        }.compactMap { $0 }
    }

    var remove: [Subscription]? {
        guard let realm = Realm.current else { return [] }
        return raw?["remove"].array?.map {
            return Subscription.getOrCreate(realm: realm, values: $0, updates: nil)
        }.compactMap { $0 }
    }

    var list: [Subscription]? {
        guard let realm = Realm.current else { return [] }
        return raw?["result"].array?.map {
            return Subscription.getOrCreate(realm: realm, values: $0, updates: nil)
        }.compactMap { $0 }
    }

    var success: Bool? {
        return raw?["success"].bool
    }
}
