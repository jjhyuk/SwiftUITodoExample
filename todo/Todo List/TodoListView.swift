//
//  TodoListView.swift
//  todo
//
//  Created by jinhyuk on 2020/07/22.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationView {
            List(self.viewModel.todos) { todo in
                Text(todo.title)
            }
            .navigationBarTitle(Text("Todo List"))
        }
            /// 뷰가 나타날때 Todo 정보 가져옴 
        .onAppear {
            self.viewModel.fetchTodos()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        var view = TodoListView()
        /// Mock 데이터 주입
        view.viewModel = TodoListViewModel.init(dataManager: MockDataManager())
        return view
    }
}
