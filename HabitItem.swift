//
//  HabitItem.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/13/23.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var emoji: String
    var dayStreak = 0
    
    init(name: String, description: String, emoji: String) {
        self.name = name
        self.description = description
        self.emoji = emoji
    }
    
    static let example_habit_list: [HabitItem] = [
        HabitItem(name: "Exercise", description: "Work out for 30 minutes", emoji: "🏋️‍♂️"),
        HabitItem(name: "Meditation", description: "Meditate for 10 minutes", emoji: "🧘‍♀️"),
        HabitItem(name: "Reading", description: "Read a book for 20 minutes", emoji: "📚"),
        HabitItem(name: "Water Intake", description: "Drink 8 glasses of water", emoji: "💧"),
        HabitItem(name: "Coding", description: "Code for an hour", emoji: "💻"),
        HabitItem(name: "Journal", description: "Write down things you're grateful for", emoji: "📖"),
        HabitItem(name: "Walking", description: "Take a 30-minute walk", emoji: "🚶‍♀️"),
        HabitItem(name: "Learn Something New", description: "Learn a new skill or language", emoji: "🎓"),
        HabitItem(name: "Yoga", description: "Practice yoga for 20 minutes", emoji: "🧘‍♂️"),
        HabitItem(name: "Healthy Eating", description: "Eat a balanced meal", emoji: "🥗")
    ]
}
