//
//  MenuDataSource.swift
//  MokaCodingTDD
//
//  Created by Ikhtiyor Nurmatov on 27/01/22.
//

import Foundation

struct Pizza {
	let name: String
}

struct MenuItem {
	let title: String
}

extension MenuItem {
	init(pizza: Pizza) {
		self.init(title: pizza.name)
	}
}

struct MenuDataSource {
	let pizzas: [Pizza]
	
	let numberOfSections = 1
	
	func numberOfRows(inSection section: Int) -> Int {
		guard section == 0 else { return 0 }
		
		return pizzas.count
	}
	
	func item(forRow row: Int, inSection section: Int) -> MenuItem? {
		guard section == 0 else { return .none }
		guard
			row >= 0,
			pizzas.count > row
		else {
			return .none
		}
		
		return MenuItem(pizza: pizzas[row])
	}
}
