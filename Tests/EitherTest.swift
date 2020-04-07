//
//  Tests.swift
//  Tests
//
//  Created by BTC Komatsu on 2020/04/07.
//

import XCTest

class EitherTests: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let p: Either<String, Int> = .Right(5)
        let q: Either<String, Int> = .Left("Derp")
        let f: (Int) -> Int = {x in x + 10}
        let g: (String) -> Int = {s in s.count}
        XCTAssertEqual(p.either(g, or: f), 15)
        XCTAssertEqual(q.either(g, or: f), 4)
    }
}
