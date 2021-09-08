//
//  NoteView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 30/8/21.
//

import SwiftUI


struct TaskView: View {
    
    var body: some View {
        NavigationView{
            
            TaskHomeView()
                .navigationBarTitle("", displayMode: .inline)
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
        .introspectTableView {
            $0.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        }
    }
}

struct TaskHomeView : View{
    @EnvironmentObject var taskViewModel : TaskViewModel
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending :true)], animation: .spring()) var result : FetchedResults<Task>
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            
            //Empty View
            VStack{
                if result.isEmpty{
                    Spacer()
                    
                    Text("No Task..")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                }else{
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(alignment: .leading, spacing: 20) {
                            ForEach(result){task in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(task.content ?? "")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Text(task.date ?? Date(), style: .date)
                                        .font(.body)
                                    Divider().foregroundColor(.white)
                                }
                                .contextMenu{
                                    Button(action: {
                                        self.taskViewModel.updateTask(item: task)
                                    }, label: {
                                        Text("Edit")
                                    })
                                    Button(action: {
                                        context.delete(task)
                                        try! context.save()
                                    }, label: {
                                        Text("Delete")
                                    })
                                }
                            }
                        }.padding()
                    }
                }
                
                HStack{
                    Spacer()
                    Button {
                        taskViewModel.isNewData.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .font(.largeTitle)
                            .padding(10)
                            .background(AngularGradient(gradient: .init(colors: [Color("orange"), Color.purple]), center: .center))
                            .clipShape(Circle())
                        
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                }
            }
            
        })
        
        .sheet(isPresented: $taskViewModel.isNewData, content: {
            return AddTaskView().environmentObject(self.taskViewModel)
        })
    }
}

struct AddTaskView : View {
    @EnvironmentObject var taskViewModel : TaskViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View{
        VStack{
            HStack{
                Text("\(taskViewModel.updateItem == nil ? "Add New" : "Update") Task")
                    .font(.system(size: 65))
                    .fontWeight(.heavy)
                Spacer(minLength: 0)
            }
            .padding()
            TextEditor(text: $taskViewModel.content)
                .background(Color("lightGray"))
                .cornerRadius(10)
                .padding(.horizontal, 20)
            
            Divider()
                .padding(.horizontal)
            
            HStack{
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing : 10){
                DateButtonView(title: "today")
                DateButtonView(title: "tomorrow")
                
                DatePicker("", selection: $taskViewModel.date, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            
            Button(action: {
                self.taskViewModel.addTask(context: context)
            }, label: {
                Label(
                    title: { Text((taskViewModel.updateItem == nil ? "Add Now" : "Update Now"))
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    },
                    icon: { Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                    })
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 3)
                    .background(
                        LinearGradient(gradient: .init(colors: [Color.purple, Color("orange")]), startPoint: .leading, endPoint: .trailing))
            })
            .padding()
            .disabled(taskViewModel.content == "" ? true : false)
            .opacity(taskViewModel.content == "" ? 0.5 : 1)
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
    }
}

struct DetailTaskView : View {
    var body: some View{
        VStack{
            
        }
    }
}

struct DateButtonView : View {
    @EnvironmentObject var taskViewModel : TaskViewModel
    @State var title : String
    
    var body: some View{
        Button(action: {
            self.taskViewModel.updateDate(value: title)
        }, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(taskViewModel.checkDate() == title ? .white : .gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    
                    taskViewModel.checkDate() == title ?
                        LinearGradient(gradient: .init(colors: [Color.purple, Color("orange")]), startPoint: .leading, endPoint: .trailing)
                        
                        : LinearGradient(gradient: .init(colors: [Color.white]), startPoint: .leading, endPoint: .trailing))
        })
        .cornerRadius(6)
        
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView().environmentObject(TaskViewModel())
    }
}
