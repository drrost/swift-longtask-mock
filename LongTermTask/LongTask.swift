//
//  LongTask.swift
//  LongTermTask
//
//  Created by Rostyslav Druzhchenko on 09.06.2020.
//  Copyright © 2020 Rostyslav Druzhchenko. All rights reserved.
//

import Foundation

class LongTask {

    private let time: TimeInterval
    private var period: TimeInterval = 0.01
    private var startedAt: Date!
    private var shouldFinishAt: Date!

    // MARK: - Init

    init(_ time: TimeInterval) {
        self.time = time
    }

    // MARK: - Public

    func begin(_ progress: @escaping ProgressClosure,
               _ completion: @escaping CompletionClosure) {

        startedAt = Date()
        shouldFinishAt = startedAt + time
        tick(progress, completion)
    }

    private func tick(_ progress: @escaping ProgressClosure,
                      _ completion: @escaping CompletionClosure) {

        DispatchQueue.main.asyncAfter(deadline: .now() + period) { [weak self] in

            guard let self = self else { return }

            let now = Date()
            let spent = now.timeIntervalSince(self.startedAt)
            let total = self.shouldFinishAt.timeIntervalSince(self.startedAt)

            progress(spent / total)

            if now >= self.shouldFinishAt {
                completion(nil)
            } else {
                self.tick(progress, completion)
            }
        }
    }
}
