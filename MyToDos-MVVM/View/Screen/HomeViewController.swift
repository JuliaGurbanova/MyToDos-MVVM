//
//  HomeViewController.swift
//  MyToDos-MVVM
//
//  Created by Julia Gurbanova on 07.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    private var homeView: HomeView!

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupHomeView()
    }

    private func setupHomeView() {
        let viewModel = HomeViewModel(tasksListService: TasksListService())
        homeView = HomeView(viewModel: viewModel)
        homeView.delegate = self
        self.view = homeView
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func addList() {
        navigationController?.pushViewController(AddListViewController(), animated: true)
    }

    func selectedList(_ list: TasksListModel) {
        let taskListViewController = TaskListViewController(tasksListModel: list)
        navigationController?.pushViewController(taskListViewController, animated: true)
    }
}
