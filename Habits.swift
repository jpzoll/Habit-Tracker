//
//  Habits.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/15/23.
//

import Foundation
class Habits: ObservableObject {
    // 📋 Published property to store habit items
    @Published var items: [HabitItem] {
        didSet {
            do {
                // 📦 Encode and save habit items to UserDefaults
                let data = try JSONEncoder().encode(items)
                UserDefaults.standard.setValue(data, forKey: "Habits")
            }
            catch {
                print("Failed to encode and save habits to UserDefaults: \(error)")
            }
        }
    }
    
    // 🏁 Initialize the Habits model with data from UserDefaults
    init(items: [HabitItem] = [HabitItem]()) {
        if let data = UserDefaults.standard.data(forKey: "Habits") {
            if let decoded = try? JSONDecoder().decode([HabitItem].self, from: data) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
    // 🗑 Method to delete a habit item
    public func onDelete(_ habitToDelete: HabitItem) {
        if let indexToDelete = self.items.firstIndex(where: { $0.id == habitToDelete.id }) {
            self.items.remove(at: indexToDelete)
        }
    }
}

