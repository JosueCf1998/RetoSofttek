//
//  MoviesPresenterTetst.swift
//  RetoSwiftSoftTekTests
//
//  Created by josue on 9/10/24.
//

import XCTest
@testable import RetoSwiftSoftTek

final class MoviesPresenterTest: XCTestCase {
    
    var interactor: MoviesInteractorProtocol = MockMoviesInteractor()
    var router: MoviesRouterProtocol = MoviesRouter()
    var presenter: (any MoviesPresenterProtocol)!
    
    
    func testWhenRequestListMoviesThenReceiveSuccessResponse() {
        interactor = MockMoviesInteractor(true)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getListMovies()
        XCTAssertEqual(self.presenter?.listMovies.isEmpty, true)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.listMovies.isEmpty, false)
        }
    }
    
    func testWhenRequestListMoviesThenReceiveFailureResponse() {
        interactor = MockMoviesInteractor(false)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getListMovies()
        XCTAssertEqual(self.presenter?.isShowingError, false)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.isShowingError, true)
        }
    }
    
    func testWhenRequestSearchMoviesThenReceiveSuccessResponse() {
        interactor = MockMoviesInteractor(true)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getSearchMovies()
        XCTAssertEqual(self.presenter?.searchMovies.isEmpty, true)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.searchMovies.isEmpty, false)
        }
    }
    
    func testWhenRequestSearchMoviesThenReceiveFailureResponse() {
        interactor = MockMoviesInteractor(false)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getSearchMovies()
        XCTAssertEqual(self.presenter?.isShowingError, false)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.isShowingError, true)
        }
    }
    
    func testWhenRequestListMoviesMemoryThenReceiveSuccessResponse() {
        interactor = MockMoviesInteractor(true)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getListMoviesMemory()
        XCTAssertEqual(self.presenter?.recentMovies.isEmpty, true)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.recentMovies.isEmpty, false)
        }
    }
    
    func testWhenRequestListMoviesMemoryThenReceiveFailureResponse() {
        interactor = MockMoviesInteractor(false)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getListMoviesMemory()
        XCTAssertEqual(self.presenter?.isShowingError, false)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.isShowingError, true)
        }
    }
    
    func testWhenRequestSaveMovieMemoryThenReceiveSuccessResponse() {
        interactor = MockMoviesInteractor(true)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getSaveMovieMemory()
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssert(true)
        }
    }
    
    func testWhenRequestSaveMovieMemoryThenReceiveFailureResponse() {
        interactor = MockMoviesInteractor(false)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.selectedMovie = MovieDetailModel(posterPath: "dummy", title: "dummy", voteAverage: 0.0, releaseDate: "dummy", overview: "dummy")
        presenter.getSaveMovieMemory()
        XCTAssertEqual(self.presenter?.isShowingError, false)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.isShowingError, true)
        }
    }
    
    func testWhenRequestDeleteMovieMemoryThenReceiveSuccessResponse() {
        interactor = MockMoviesInteractor(true)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getDeleteMovieMemory(0)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssert(true)
        }
    }
    
    func testWhenRequestDeleteMovieMemoryThenReceiveFailureResponse() {
        interactor = MockMoviesInteractor(false)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getDeleteMovieMemory(0)
        XCTAssertEqual(self.presenter?.isShowingError, false)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.isShowingError, true)
        }
    }
    
    func testWhenRequestDeleteAllMoviesMemoryThenReceiveSuccessResponse() {
        interactor = MockMoviesInteractor(true)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getDeleteAllMoviesMemory()
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssert(true)
        }
    }
    
    func testWhenRequestDeleteAllMoviesMemoryThenReceiveFailureResponse() {
        interactor = MockMoviesInteractor(false)
        router = MoviesRouter()
        presenter = MoviesPresenter(interactor: interactor, router: router)
        presenter.getDeleteAllMoviesMemory()
        XCTAssertEqual(self.presenter?.isShowingError, false)
        let exp = expectation(description: "Return thrown async call")
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            exp.fulfill()
        }
        waitForExpectations(timeout: 30)  { error in
            if let error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(self.presenter?.isShowingError, true)
        }
    }
    
    
}
