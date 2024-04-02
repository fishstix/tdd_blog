//
//  AuthExpectations.swift
//  tdd-blogTests
//
//  Created by Scott FIsher on 4/1/24.
//

import Nimble

func beLoggedIn() -> Nimble.Matcher<TestEnvironment> {
    return Matcher.define { actualExpression in
        let testEnvironment: TestEnvironment = try! actualExpression.evaluate()!
        let isLoggedIn = testEnvironment.isLoggedIn()
        return MatcherResult.init(
            bool: isLoggedIn,
            message: .expectedCustomValueTo(
                "Expected to be logged in",
                actual: "Was not logged in"
            )
        )
    }
}
