//
//  Networking.swift
//  LongTermTask
//
//  Created by Rostyslav Druzhchenko on 09.06.2020.
//  Copyright © 2020 Rostyslav Druzhchenko. All rights reserved.
//

class Networking: INetworking {

    let longTask = LongTask(Double.random(in: 7.0...12.0))

    func downloadAsset(_ progress: @escaping ProgressClosure,
                       _ completion: @escaping CompletionClosure) {

        longTask.begin(progress, completion)
    }
}
