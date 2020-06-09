//
//  INetworking.swift
//  LongTermTask
//
//  Created by Rostyslav Druzhchenko on 09.06.2020.
//  Copyright © 2020 Rostyslav Druzhchenko. All rights reserved.
//

typealias ProgressClosure = (Double) -> Void
typealias CompletionClosure = (Error?) -> Void

protocol INetworking {

    func downloadAsset(_ progress: @escaping ProgressClosure,
                       _ completion: @escaping CompletionClosure)
}
