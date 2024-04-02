//
//  AuthSpec.swift
//  tdd-blogTests
//
//  Created by Scott FIsher on 4/1/24.
//

import Quick
import Nimble

class AuthSpec: QuickSpec {

    override class func spec() {
        
        describe("Login") {
            
            var testEnvironment: TestEnvironment!
            
            beforeEach {
                testEnvironment = .init()
                testEnvironment.launchApp()
            }

            it("Should not be logged in") {
                expect(testEnvironment).toNot(beLoggedIn())
            }

            describe("Login to the app") {
                beforeEach {
                    testEnvironment.login()
                }
                
                it("Should be logged in") {
                    expect(testEnvironment).to(beLoggedIn())
                }
            }
            
            
        }
        
    }
    
}
