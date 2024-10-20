//
//  ExperiencePresenter.swift
//  SwiftCV
//
//  Created by José María Jiménez on 20/10/24.
//

import DependencyResolver
import Utils

protocol ExperiencePresenterProtocol {
    var view: ExperienceView? { get set }
    func viewDidLoad()
}

final class ExperiencePresenter {

    @Injected private var getAllJobsUseCase: GetAllJobsUseCase

    weak var view: ExperienceView?
    private var currentTask: Task<Void, Never>?

    deinit {
        currentTask?.cancel()
    }
}

extension ExperiencePresenter: ExperiencePresenterProtocol {
    func viewDidLoad() {
        currentTask = Task { [weak self] in
            do {
                let jobs = try await self?.getAllJobsUseCase.execute()
                runInMain {
                    guard let jobs else { return }
                    self?.view?.updateJobs(with: jobs)
                }
            } catch {
                // TODO: error handling
            }
        }
    }
}
