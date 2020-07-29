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

    @State private var isShowingAddNew: Bool = false
    
    
    private var addNewButton: some View {
        Button(action: {
            self.isShowingAddNew.toggle()
        }) {
            Image(systemName: "plus")
        }
    }
    
    var body: some View {
        NavigationView {
            List(self.viewModel.todos) { todo in
                Text(todo.title)
            }
            .navigationBarTitle(Text("Todo List"))
            /// 생성한 Button View를 네비게이션바에 추가
            .navigationBarItems(trailing: self.addNewButton)
        }
        /// isShowingAddNew의 값에 따라 뷰 컨트롤러를 연다.
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            self.viewModel.fetchTodos()
        }) {
            NewTodoView(viewModel: NewTodoViewModel())
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
