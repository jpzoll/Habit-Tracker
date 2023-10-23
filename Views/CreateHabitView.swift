//
//  CreateHabitView.swift
//  HabitTracker
//
//  Created by Joe Zoll on 10/14/23.
//

import SwiftUI
struct CreateHabitView: View {
    // 🧩 ObservedObject to access the Habits model
    @ObservedObject var habits: Habits
    
    // 📝 States for name, description, and emoji input
    @State private var name = ""
    @State private var description = ""
    @State private var emoji = ""
    
    // 🌐 Environment property to dismiss the view
    @Environment(\.dismiss) var dismiss
    
    // 🌈 Environment property to access color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // 🚦 State to track input validation error
    @State private var isShowingInputError = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section("Name:") {
                        TextField("", text: $name)
                            .font(.body)
                            .fontWeight(.thin)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .background(Color.gray.opacity(0.5))
                            .border(.clear, width: 0)
                    }
                    .border(.clear, width: 1)
                    .textCase(.none)
                    .font(.title3)
                    .fontWeight(.semibold)
                    Section("Description:") {
                        TextEditor(text: $description)
                            .font(.body)
                            .fontWeight(.thin)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .frame(width: 325, height: 300)
                            .background(Color.gray.opacity(0.5))
                            .border(.clear, width: 0)
                    }
                    .textCase(.none)
                    .font(.title3)
                    .fontWeight(.semibold)
                    Section("Symbol (Choose 1 Character):") {
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 50, height: 50)
                            .cornerRadius(34)
                            .overlay (
                                TextField("", text:
                                    Binding(
                                        get: { self.emoji },
                                        set: { newValue in
                                            if self.emoji.count > 1 {
                                                self.emoji = String(newValue.prefix(1))
                                            } else {
                                                self.emoji = newValue
                                            }
                                        }
                                    ))
                                .font(.body)
                                .fontWeight(.thin)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .multilineTextAlignment(.center)
                                .background(Color.clear) // Set the background to clear
                                .border(Color.clear, width: 1) // Remove the border
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        )
                    }
                    .textCase(.none)
                    .font(.title3)
                    .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .scrollContentBackground(.hidden)
                .background(.indigo)
                
                .toolbar {
                    Button {
                        if name == "" || emoji == "" {
                            // ❌ Show input error if required fields are empty
                            isShowingInputError = true
                            return
                        }
                        // ✅ Create a new habit and add it to the list
                        let newHabit = HabitItem(name: name, description: description, emoji: emoji)
                        habits.items.append(newHabit)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                }
                .alert("Incomplete Input", isPresented: $isShowingInputError)
                {
                    Button("OK") {
                        isShowingInputError = false
                    }
                }
            }
        }
    }
}


struct CreateHabitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabitView(habits: Habits(items: []))
    }
}
