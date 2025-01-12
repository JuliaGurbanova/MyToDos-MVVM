//
//  AddListViewController.swift
//  MyToDos-MVVM
//
//  Created by Julia Gurbanova on 10.04.2024.
//

import UIKit

class AddListViewController: UIViewController {
    private var addListView: AddListView!

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupAddListView()
    }

    private func setupAddListView() {
        let viewModel = AddListViewModel(tasksListService: TasksListService())
        addListView = AddListView(viewModel: viewModel)
        addListView.delegate = self
        self.view = addListView
    }
}

extension AddListViewController: BackButtonDelegate {
    func navigateBack() {
        navigationController?.popViewController(animated: true)
    }
}
