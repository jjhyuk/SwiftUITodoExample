//
//  Todo.swift
//  todo
//
//  Created by jinhyuk on 2020/07/22.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation

/// Todo 모델 구조체. Apple에선 Class보단 Struct 사용을 권하고 있다.
/// https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes
/// Protocol 'Identifiable' 채택. Stable Identitier 제공,
/// 고유한 ID를 제공한다. identity, state를 구분, 안정적(변하지 않음)
/// 자세한 설명 링크: https://nshipster.com/identifiable/

/// Equatable - 내부의 값이 같다는 의미, Identifiable과 다르게 고유함과 거리가 있음.
///
/// Hashable -
/// Identifiable와의 차이점
/// 객체의 상태에 따라 Hash 값이 변할수 있다.
/// 실행시 임의로 생성되기에 불안정(unstable)하다.
/// 충돌 가능성이 존재한다.
/// Hash값이기에 가독성(? 혹은 값의 의미) 떨어진다.
struct Todo: Identifiable, Equatable {
    
    /// UUID 형식으로 id 값을 세팅
    var id = UUID()
    /// 제목
    var title: String
    /// 완료 여부
    var isCompleted = false
}
