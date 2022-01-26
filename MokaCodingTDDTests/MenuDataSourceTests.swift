//
//  MenuDataSourceTests.swift
//  MokaCodingTDDTests
//
//  Created by Ikhtiyor Nurmatov on 27/01/22.
//

@testable import MokaCodingTDD
import XCTest

class MenuDataSourceTests: XCTestCase {

	func test_HasOneSection() {
		let dataSource = MenuDataSource(pizzas: [.fixture()])
		
		XCTAssertEqual(dataSource.numberOfSections, 1)
	}
	
	func test_RowsInSections() {
		let dataSource = MenuDataSource(pizzas: [.fixture(), .fixture(), .fixture()])
		
		XCTAssertEqual(dataSource.numberOfRows(inSection: 0), 3)
	}
	
	func test_RowsInOutOfBoundsSectionIsZero() {
		let dataSource = MenuDataSource(pizzas: [.fixture(), .fixture(), .fixture()])
		
		XCTAssertEqual(dataSource.numberOfRows(inSection: 1), 0)
		XCTAssertEqual(dataSource.numberOfRows(inSection: -1), 0)
	}
	
	func test_ItemForRowAndSection() {
		let dataSource = MenuDataSource(pizzas: [
			.fixture(name: "Margherita"),
			.fixture(name: "Capricciosa")
		])
		
		XCTAssertEqual(dataSource.item(forRow: 0, inSection: 0)?.title, "Margherita")
		XCTAssertEqual(dataSource.item(forRow: 1, inSection: 0)?.title, "Capricciosa")
	}
	
	func test_ItemForOutOfBoundsRowAndSectionIsNil() {
		let dataSource = MenuDataSource(pizzas: [
			.fixture(name: "Margherita"),
			.fixture(name: "Capricciosa")
		])
		
		XCTAssertNil(dataSource.item(forRow: 2, inSection: 0))
		XCTAssertNil(dataSource.item(forRow: 0, inSection: 1))
		XCTAssertNil(dataSource.item(forRow: 2, inSection: 1))
		XCTAssertNil(dataSource.item(forRow: -1, inSection: -1))
	}
}
