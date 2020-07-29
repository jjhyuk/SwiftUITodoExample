//
//  KeyboardResponder.swift
//  todo
//
//  Created by jinhyuk on 2020/07/29.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import SwiftUI
import Combine

/// 키보드 높이 및 애니메이션 길이 구하기
protocol KeyboardResponderProtocol {
    var currentHeight: CGFloat { get }
    var duration: TimeInterval { get }
}

final class KeyboardResponder: KeyboardResponderProtocol, ObservableObject {
    @Published private(set) var currentHeight: CGFloat = 0
    private(set) var duration: TimeInterval = 0.3
    private var cancellableBag = Set<AnyCancellable>()
    
    init() {
        
        let keyboardWillShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        let keyboardWillHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        
        _ = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .receive(on: RunLoop.main)
            /// 아래 같은 코드 Closure
            //.sink { [weak self] in self?.keyboardNotification($0) }
            .sink(receiveValue: { output in
                self.keyboardNotification(output)
            })
            .store(in: &cancellableBag)
    }
    
    private func keyboardNotification(_ notification: Notification) {
        
        let isShowing = notification.name == UIResponder.keyboardWillShowNotification
        if let userInfo = notification.userInfo {
            duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.0
            
            let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            
            if isShowing {
                currentHeight = endFrame?.height ?? 0.0
            } else {
                currentHeight = 0.0
            }
        }
    }
    
}
