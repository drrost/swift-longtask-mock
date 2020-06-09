//
//  LongTask.swift
//  LongTermTask
//
//  Created by Rostyslav Druzhchenko on 09.06.2020.
//  Copyright © 2020 Rostyslav Druzhchenko. All rights reserved.
//

import Foundation

class LongTask {

    let time: TimeInterval
    var spent: TimeInterval = 0.0
    var period: TimeInterval = 1.0

    // MARK: - Init

    init(_ time: TimeInterval) {
        self.time = time
    }

    deinit {
        print("LongTask killed")
    }

    // MARK: - Public

    func begin(_ progress: @escaping ProgressClosure,
               _ completion: @escaping CompletionClosure) {

        spent = 0;
        tick(progress, completion)
    }

    private func tick(_ progress: @escaping ProgressClosure,
                      _ completion: @escaping CompletionClosure) {

        DispatchQueue.main.asyncAfter(deadline: .now() + period) { [weak self] in

            guard let self = self else { return }
            self.spent += self.period

            progress(self.spent / self.time)

            if self.spent >= self.time {
                completion(nil)
            } else {
                self.tick(progress, completion)
            }
        }
    }
}
