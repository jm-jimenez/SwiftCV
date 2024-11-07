//
//  ExperiencePresenterTests.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import XCTest
import DependencyResolver
@testable import SwiftCV

final class ExperiencePresenterTests: XCTestCase {
    var sut: ExperiencePresenter!
    var mockView = ExperienceViewMock()

    private var mockProvider = JobsProviderMock()

    override func setUp() {
        super.setUp()
        setupDependencies()
    }

    override func tearDown() {
        super.tearDown()
        DefaultDependencyResolver.shared.clear()
        sut = nil
    }

    func testViewDidLoad_shouldRetrieveJobs() {
        // Given
        let expectation = expectation(description: "waiting for jobs")
        mockProvider.result = .success(JobModel.testSuite)
        mockView.completion = { jobs in
            // Then
            XCTAssertTrue(jobs.isNotEmpty)
            expectation.fulfill()
        }
        // When
        sut.viewDidLoad()
        wait(for: [expectation])
    }
}

private extension ExperiencePresenterTests {
    func setupDependencies() {
        mockProvider = JobsProviderMock()
        registerDependency(AppSettingsProtocol.self) {
            let appSettings = AppSettings()
            appSettings.currentLanguage = .english
            return appSettings
        }
        registerDependency(JobsProvider.self) {
            self.mockProvider
        }
        registerDependency(GetAllJobsUseCase.self) {
            GetAllJobsUseCase()
        }
        sut = ExperiencePresenter()
        sut.view = mockView
    }
}
