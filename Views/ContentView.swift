//
//  ContentView.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    // 📂 Initialize the Habits model using @StateObject
    @StateObject var habits = Habits()
    
    // 📝 State to control the new habit creation sheet
    @State private var isCreatingNewHabit = false
    
    // 📐 Define the grid layout for habit cards
    let layout = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // 📜 ScrollView to display habit cards
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(habits.items, id: \.id) { habit in
                            NavigationLink {
                                HabitDetail(habits: habits, habit: habit)
                            } label: {
                                // 🃏 HabitCard with delete action
                                HabitCard(habit: habit) { _ in
                                    withAnimation {
                                        habits.onDelete(habit)
                                    }
                                }
                                .frame(width: 170, height: 180)
                                .padding(.top, 50)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 40)
                .background(Color.gray.opacity(0.5))
                .ignoresSafeArea()
                
                // ➕ Button to create a new habit
                VStack {
                    Spacer()
                    Button {
                        isCreatingNewHabit = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.indigo)
                            .background(.white)
                            .clipShape(Circle())
                            .frame(width: 100)
                            .shadow(radius: 10)
                    }
                }
            }
        }
        .sheet(isPresented: $isCreatingNewHabit) {
            // 📝 Present the CreateHabitView as a sheet
            CreateHabitView(habits: habits)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
