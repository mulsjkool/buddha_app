//
//  UNUserNotificationCenter+Extension.swift
//  NCCommon
//
//  Created by Chinh Phung on 1/10/22.
//

import Foundation

public extension UNUserNotificationCenter {
    func removeUnwantedNotifications() {
        UNUserNotificationCenter.current().getDeliveredNotifications { (notifications) in
            let identifiersToBeRemoved = notifications.compactMap({ $0.request.content.categoryIdentifier == "TO_BE_REMOVED" ? $0.request.identifier : nil })
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: identifiersToBeRemoved)
        }
    }
}
