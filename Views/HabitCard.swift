//
//  HabitBox.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/13/23.
//

import SwiftUI

struct HabitCard: View {
    @State var habit: HabitItem
    var onDelete: (HabitItem) -> ()
    
    @State private var isDeletingHabit = false
    var body: some View {
        VStack {
            ZStack {
                    Rectangle()
                    .fill(Color.indigo)
//                        .fill(Color(
//                            red: Double(0x60) / 255.0,
//                            green: Double(0x5F) / 255.0,
//                            blue: Double(0xE0) / 255.0,
//                            opacity: 1.0
//                        ))
                        .border(.white)
                
                HStack {
                    Spacer()
                    Button {
                        print("delete")
                        isDeletingHabit = true
                    } label: {
                        Circle()
                       .frame(width: 40, height: 40)
                       .foregroundColor(.clear)
                       .overlay(
                           Image(systemName: "trash.fill")
                               .foregroundColor(.white)
                               .padding(10)
                        )
                    }
                    .offset(x: -2.5, y: -75)
                    }
                .alert("Are you sure you want to delete \(habit.name)?", isPresented: $isDeletingHabit) {
                    Button("Cancel", role: .cancel) {
                        print("Cancel")
                    }
                    Button("Delete", role: .destructive) {
                        onDelete(habit)
                    }
                }
                Spacer()
                    VStack {
                        Text("\(habit.name)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.medium)
                            .padding(.top, 40)
                        Spacer()
                        Text("\(habit.emoji)")
                            .foregroundColor(.white)
                            .font(.system(size: 75))
                            .padding(.bottom, 40)
                    }
                }
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(34)
        .shadow(radius: 2)
        .border(.white, width: 8)
    }
}

//struct HabitCard_Previews: PreviewProvider {
//    @State var habits = [HabitItem(name: "Yoga", description: "Yoga 20minutes", emoji: "📿")]
//    @State var habit = HabitItem(name: "Yoga", description: "Yoga 20minutes", emoji: "📿")
//    static var previews: some View {
//        HabitCard(habit: habit) { _ in
//            habits.onDelete(habit)
//        }
//            .preferredColorScheme(.dark)
//    }
//}
