//
//  TaskListViewControllerTests.swift
//  MyToDos-MVVMTests
//
//  Created by Julia Gurbanova on 11.04.2024.
//

import XCTest
@testable import MyToDos_MVVM

final class TaskListViewControllerTests: XCTestCase {
    var sut: TaskListViewController!
    var navigationController: MockNavigationController!
    let list = TasksListModel(id: ProcessInfo().globallyUniqueString,
                              title: "Test title",
                              icon: "test.icon",
                              tasks: [TaskModel](),
                              createdAt: Date())

    override func setUpWithError() throws {
        sut = TaskListViewController(tasksListModel: list)
        navigationController = MockNavigationController(rootViewController: UIViewController())
        navigationController.pushViewController(sut, animated: false)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
        super.tearDown()
    }

    func testPopVC_whenBackActionIsCalledThenPopHomeCalled() {
        sut.navigateBack()
        XCTAssertTrue(navigationController.vcIsPopped)
    }
}
