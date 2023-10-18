//
//  HabitDetail.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/13/23.
//

import SwiftUI

struct HabitDetail: View {
    var habit = HabitItem(name: "name", description: "d", emoji: "s")
    var body: some View {
        VStack {
            Text("\(habit.name)")
                .font(.largeTitle)
            Text("\(habit.description)")
            Text("\(habit.emoji)")
        }
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetail(habit: HabitItem(name: "Run", description: "running!!!", emoji: "🏃‍♂️"))
    }
}
