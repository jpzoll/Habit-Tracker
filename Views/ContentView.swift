//
//  ContentView.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var isCreatingNewHabit = false
    let layout = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(habits.items, id: \.id) { habit in
                            NavigationLink {
                                HabitDetail(habits: habits, habit: habit)
                            } label: {
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
                //.background(Color.indigo.saturation(0.5))
                .ignoresSafeArea()
                
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
            CreateHabitView(habits: habits)
        }
        .onAppear {
            habits.items = HabitItem.example_habit_list
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
