//
//  AddListViewControllerTests.swift
//  MyToDos-MVVMTests
//
//  Created by Julia Gurbanova on 11.04.2024.
//

import XCTest
@testable import MyToDos_MVVM

final class AddListViewControllerTests: XCTestCase {
    var sut: AddListViewController!
    var navigationController: MockNavigationController!

    override func setUpWithError() throws {
        sut = AddListViewController()
        navigationController = MockNavigationController(rootViewController: UIViewController())
        navigationController.pushViewController(sut, animated: false)
        navigationController.vcIsPushed = false
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
