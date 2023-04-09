//
//  HomeEntities.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 8/4/23.
//

import Foundation

enum ActivityStatus {
    case approved
    case pending
    case rejected
}

struct MyCase {
    let title: String
    let trackingId: String
    let statusDetails: String
    let lastUpdated: String
    let style: ActivityStatus
}
