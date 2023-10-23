//
//  HabitDetail.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/13/23.
//

import SwiftUI

struct HabitDetail: View {
    // 🧩 ObservedObject to access the Habits model
    @ObservedObject var habits: Habits
    
    // 📝 State for the current habit
    @State var habit: HabitItem
    
    var body: some View {
        VStack {
            Text("\(habit.name)")
                .font(.largeTitle)
            Text("\(habit.description)")
            Text("\(habit.emoji)")
            Text("Days in a row: \(habit.dayStreak)")
                .font(.headline)
            Button {
                if let index = habits.items.firstIndex(where: { $0.id == habit.id }) {
                    // ➕ Increase the day streak and update the model
                    habit.dayStreak += 1
                    habits.items[index] = habit
                }
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                    .background(.gray)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

//struct HabitDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        HabitDetail(habits: Habits(items: [HabitItem(name: "Run", description: "running!!!", emoji: "🏃‍♂️")]), index: 0)
//    }
//}
