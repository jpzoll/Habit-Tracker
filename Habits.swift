//
//  Habits.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/15/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var items: [HabitItem] {
        didSet {
            do {
                let data = try JSONEncoder().encode(items)
                UserDefaults.standard.setValue(data, forKey: "Habits")
            }
            catch {
                print("Failed to encode and save habits to UserDefaults: \(error)")
            }
        }
    }
    
    init(items: [HabitItem] = [HabitItem]()) {
        if let data = UserDefaults.standard.data(forKey: "Habits") {
            if let decoded = try? JSONDecoder().decode([HabitItem].self, from: data) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
    public func onDelete(_ habitToDelete: HabitItem) {
        if let indexToDelete = self.items.firstIndex(where: { $0.id == habitToDelete.id }) {
            self.items.remove(at: indexToDelete)
        }
    }
}
