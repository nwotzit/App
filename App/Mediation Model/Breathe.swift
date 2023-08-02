//
//  Breath.swift
//  App
//
//  Created by tue on 8/2/23.
//

import SwiftUI

struct Breath: Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var title: String
    
}

let sampleTypes: [Breath] = [
    .init(title: "inhale")
]
