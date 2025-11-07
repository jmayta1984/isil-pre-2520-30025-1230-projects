//
//  MealDao.swift
//  EasyMeal
//
//  Created by Jorge Mayta on 6/11/25.
//

import CoreData

class MealDao {
    static let shared = MealDao()
    let context = PersistenceController.shared.container.viewContext
    
    private init() {}
    
    func insert(meal: Meal) {
        let entity = MealEntity(context: context)
        entity.id = meal.id
        entity.name = meal.name
        entity.posterPath = meal.posterPath
        saveContext()
    }
    
    func delete(meal: Meal) {
        let request: NSFetchRequest<MealEntity>
        request = MealEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", meal.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchAll() -> [Meal] {
        let request: NSFetchRequest<MealEntity>
        request = MealEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            return entities.map({ Meal(id: $0.id ?? "", name: $0.name ?? "", posterPath: $0.posterPath ?? "")})
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext(){
        
        if (context.hasChanges){
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
