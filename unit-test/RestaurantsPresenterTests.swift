//
//  RestaurantsPresenterTests.swift
//  JustEatTests
//
//  Created by Farhan Mirza on 16/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import XCTest
@testable import JustEat

class RestaurantsPresenterTest: XCTestCase {
    
    var sut: RestaurantsPresenter?
    var mockView: MockRestaurantsView?
    var mockInteractor: MockRestaurantsInteractor?
    //var mockRouter: MockRestaurantsRouter?
    
    override func setUp() {
        sut = RestaurantsPresenter()
        mockView = MockRestaurantsView()
        mockInteractor = MockRestaurantsInteractor()
        // mockRouter = MockRestaurantsRouter()
        mockInteractor?.presenter = sut
        sut?.view = mockView
        sut?.interactor = mockInteractor
        // sut?.router = mockRouter
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        //mockRouter = nil
        super.tearDown()
    }
    
    
    func testLoadRestaurantsToViewSucess() {
        sut?.loadRestaurants(by: "SE19")
        XCTAssertTrue(mockView?.sucess ?? false)
    }
    
    func testLoadRestaurantsToViewFail() {
        sut?.loadRestaurants(by: "SE18")
        XCTAssertFalse(mockView?.sucess ?? true)
    }
    
}

class MockRestaurantsView: PresenterToViewRestaurantsProtocol {
    
    var sucess = false
    
    func showRestaurants(restaurants: [Restaurant]) {
        sucess = true
    }
    
    func showError(error: String) {
        sucess = false
    }
    
}

class MockRestaurantsInteractor: PresenterToInteractorRestaurantsProtocol {
    var presenter: InteractorToPresenterRestaurantsProtocol?
    var success = false
    
    func loadRestaurants(by outcode: String) {
        if outcode == "SE19" {
            success = true
            presenter?.loadRestaurants(restaurants: [Restaurant]())
        }
        else {
            success = false
            presenter?.loadRestaurantsFailed(error: "failed")
        }
        
    }
    
}

//class MockRestaurantsRouter: PresenterToRouterRestaurantsProtocol {
//    static func createModule() -> RestaurantsViewController {
//        return RestaurantsViewController()
//    }

//}
