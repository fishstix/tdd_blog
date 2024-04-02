//
//  AuthCredentialsSpec.swift
//  tdd-blogTests
//
//  Created by Scott FIsher on 4/1/24.
//

import Quick
import Nimble

class AuthCredentialsSpec: QuickSpec {

    override class func spec() {
        
        describe("Login") {
            
            var testEnvironment: TestEnvironment!
            
            beforeEach {
                testEnvironment = .init()
                testEnvironment.launchApp()
            }

            describe("Login with correct credentials") {
                beforeEach {
                    testEnvironment.login()
                }
                
                it("Should be logged in") {
                    expect(testEnvironment).to(beLoggedIn())
                }
            }

            describe("Login with incorrect credentials") {
                beforeEach {
                    testEnvironment.loginWithIncorrectCredentials()
                }
                
                it("Should be logged in") {
                    expect(testEnvironment).toNot(beLoggedIn())
                }
            }
        }
    }
}
