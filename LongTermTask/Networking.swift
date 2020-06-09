//
//  Networking.swift
//  LongTermTask
//
//  Created by Rostyslav Druzhchenko on 09.06.2020.
//  Copyright © 2020 Rostyslav Druzhchenko. All rights reserved.
//

import Foundation

typealias ProgressClosure = (Double) -> Void
typealias CompletionClosure = (Error?) -> Void

class Networking {

    let longTask = LongTask(10.0)

    func downloadAsset(_ progress: @escaping ProgressClosure,
                       _ completion: @escaping CompletionClosure) {

        longTask.begin(progress, completion)
    }
}
