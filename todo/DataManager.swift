//
//  DataManager.swift
//  todo
//
//  Created by jinhyuk on 2020/07/22.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation

/// POP(Protocol Oriented Programming)
protocol DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool) -> [Todo]
    func add(todo: Todo)
    func toggleIsCompleted(for todo: Todo)
}

extension DataManagerProtocol {
    /// FetchTodList 초기화 함수
    /// - Parameter includingCompleted: 완료된 Todo 포함 여부
    /// - Returns: [Todo]
    func fetchTodoList(includingCompleted: Bool = false) -> [Todo] {
        
        //Swift5부터 한줄일 경우 'return' 없어도 return 된다.
        fetchTodoList(includingCompleted: includingCompleted)
    }
}

class DataManager {
    
    /// Singlton 생성
    static let shared: DataManagerProtocol = DataManager()
    private init() {}
    
    /// [Todo] 샘플이므로 모든 배열을 안에 포함
    private var todos = [Todo]()
}

extension DataManager: DataManagerProtocol {
    
    /// 완료된 Todo 포함 여부
    /// - Parameter includingCompleted: 완료된 Todo 포함 여부
    /// - Returns: [Todo]
    func fetchTodoList(includingCompleted: Bool = false) -> [Todo] {
        includingCompleted ? todos : todos.filter { !$0.isCompleted }
    }
    
    /// Todo 가장 처음에 추가
    /// - Parameter todo: Todo
    func add(todo: Todo) {
        todos.insert(todo, at: 0)
    }
    
    /// 완료 여부 전환
    /// - Parameter todo: 변경을 원하는 Todo
    func toggleIsCompleted(for todo: Todo) {
        /// 조건을 만족하는 처음 Index 반환
        if let index = todos.firstIndex(where: {$0.id == todo.id}) {
            todos[index].isCompleted.toggle()
        }
    }
}
