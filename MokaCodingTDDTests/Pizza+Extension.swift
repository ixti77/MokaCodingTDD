//
//  Pizza+Extension.swift
//  MokaCodingTDDTests
//
//  Created by Ikhtiyor Nurmatov on 27/01/22.
//

@testable import MokaCodingTDD

extension Pizza {
	static func fixture(name: String = "Margherita") -> Pizza {
		return Pizza(name: name)
	}
}
