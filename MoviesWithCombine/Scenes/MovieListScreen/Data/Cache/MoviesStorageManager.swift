//
//  MoviesStorageManager.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Foundation
import CoreData
import Combine

class MoviesStorageManager {
    
    private let mainContext: NSManagedObjectContext
    private let backgroundContext: NSManagedObjectContext
    private var cancelable = Set<AnyCancellable>()
    private let maxStorageLimit: Int = 20

    init(mainContext: NSManagedObjectContext = CoreDataManager.shared.mainContext,
        backgroundContext: NSManagedObjectContext = CoreDataManager.shared.backgroundContext
    ) {
        self.mainContext = mainContext
        self.backgroundContext = backgroundContext
    }
}

// MARK: - MoviesStorageContract

extension MoviesStorageManager: MoviesStorageContract{
    func fetchAll() -> AnyPublisher<[MoviesListResonse], BaseError> {
        
        let fetchRequest = MovieDataEntity.fetchRequest()
        var moviesDataEntities: [MovieDataEntity] = .init()
        fetchRequest.fetchLimit =  maxStorageLimit
        
        mainContext.performAndWait {
            do {
                moviesDataEntities = try mainContext.fetch(fetchRequest)
            } catch {
                print("Error fetching logs, error: \(error.localizedDescription)")
            }
        }
        
        let publisher = CurrentValueSubject<[MoviesListResonse],BaseError>(
            moviesDataEntities.map({$0.getMovieData()})
        )
        return publisher.eraseToBaseError().eraseToAnyPublisher()
    }
    
    
    func saveAll(_ movies: [MoviesListResonse]) {
        print("MoviesSave >>> \(movies.count)")
        movies.forEach{ movie in
            save(movie)
        }
    }
    
    func save(_ movieData: MoviesListResonse) {
        backgroundContext.performAndWait {
             cleanUpQueries(for: movieData, inContext: backgroundContext)
            let newMovieDataEntity = MovieDataEntity(context: backgroundContext)
            newMovieDataEntity.setDataMovies(with: movieData)
            save(backgroundContext)
        }
    }
    
    func deleteAll() {
        let deleteRequest = NSBatchDeleteRequest(
            fetchRequest: MovieDataEntity.fetchRequest()
        )
        
        backgroundContext.performAndWait {
            do {
                try backgroundContext.execute(deleteRequest)
                try backgroundContext.save()
            } catch {
                print("Error deleting all logs, error: \(error.localizedDescription)")
            }
        }
    }
    
    func removeQueries( in queries: [MovieDataEntity], _ context: NSManagedObjectContext ) {
        guard queries.count > maxStorageLimit else { return }
        print("queriesCount>>\(queries.count)")
        queries.suffix(queries.count - maxStorageLimit)
            .forEach { context.delete($0)}
        
    }
    
    func cleanUpQueries(for query: MoviesListResonse, inContext context: NSManagedObjectContext){
        let request: NSFetchRequest = MovieDataEntity.fetchRequest()
        var result =  try? context.fetch(request)
        guard let results = result else{return}
        removeQueries(in: results, context)
    }
}

// MARK: - Private Methods

private extension MoviesStorageManager {
    func save(_ context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            fatalError("Can't save Context with error: \(error)")
        }
    }
}

