//
//  QuestionsView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 4/9/21.
//

import SwiftUI
import SwiftUIRefresh

struct QuestionsView: View {
    
    var body: some View{
        QuestionViewContent()
            .navigationBarTitle("", displayMode: .inline)
    }
}

struct QuestionViewContent : View {
    @EnvironmentObject var examViewModel : ExamViewModel
    @State private var refreshShowing = false
    
    var body: some View{
        
        if !Connectivity.isConnectedToInternet() || examViewModel.questions.data.isEmpty{
            AnyView(ReconectView(message: "Check connection..", action: {
                examViewModel.getQuestions()
            }))
        }else{
            if examViewModel.isLoading {
                LoadingAnim()
            }else{
                List{
                    VStack(alignment : .leading){
                        ForEach(Array(examViewModel.questions.data.enumerated()),id:\.offset){
                            offset , questions in
                            Text(questions?.question_text ?? "")
                            
                            ForEach(Array(questions!.answers.enumerated()),id:\.offset){
                                offset, answer in
                                Text(answer?.answer_text ?? "")
                                    .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 0))
                            }
                        }
                    }
                }
                .pullToRefresh(isShowing: $refreshShowing) {
                    examViewModel.questions.data.removeAll()
                    examViewModel.getQuestions()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.refreshShowing = false
                    }
                }
                .onChange(of: self.refreshShowing) { value in}
            }
            
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView().environmentObject(ExamViewModel())
    }
}
