//
//  RecordingPracticeView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import SwiftUI

struct RecordingPracticeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var soundDetectionViewModel = SoundDetectionViewModel()
    @ObservedObject var mailViewModel = MailViewModel()
        
    var body: some View {
        VStack(spacing: 0) {
            navBar
            Spacer()
            
            ZStack {
                if soundDetectionViewModel.soundDetectionIsRunning {
                    animatedWaves
                }
                circleResult
            }
            
            Spacer()
            
            Button {
                soundDetectionViewModel.stopStartButton()
            } label: {
                CustomButton(title: soundDetectionViewModel.soundDetectionIsRunning ? "Стоп" : "Старт",
                             verticalPadding: 25)
            }
            .padding(.horizontal, 90)
            
            VStack(spacing: 8) {
                Text("Общая длительность: \(soundDetectionViewModel.totalDuration.stringFromTimeInterval())")
                    .font(.headline)
                    .foregroundColor(.accent)
                
                Text("Количество вдохов/выдохов: \(soundDetectionViewModel.breathCount)")
                    .font(.subheadline)
                    .foregroundColor(.textLight)
            }
            .padding(EdgeInsets(top: 40,
                                leading: 32,
                                bottom: 85,
                                trailing: 40))

        }
        .navigationBarBackButtonHidden()
        .background(BackgoundGradientView())
        .sheet(isPresented: $soundDetectionViewModel.showStopSheet) {
            stopSheet
                .presentationDetents([.fraction(0.45)])
                .presentationBackground(.clear)
        }
        .sheet(isPresented: $mailViewModel.isShowingMailView) {
            MailView(viewModel: mailViewModel)
        }
    }
}

extension RecordingPracticeView {
    var navBar: some View {
        HStack(spacing: 15) {
            Button(action: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Image(systemName: "arrowtriangle.backward.fill")
                    .foregroundStyle(.accent)
                    .font(.system(size: 30, weight: .medium))
            }
            Spacer()
            
        }
        .padding(EdgeInsets(top: 16,
                            leading: 15,
                            bottom: 16,
                            trailing: 15))
        .background(.bgColorLight)
    }
    
    var circleResult: some View {
        Circle()
            .foregroundStyle(.accent)
            .frame(width: 200, height: 200)
            .overlay(
                Text(soundDetectionViewModel.currentBreath)
                    .font(.largeTitle)
                    .foregroundColor(.bgColorDark)
            )
    }
    
    var animatedWaves: some View {
        ZStack {
            ForEach(0..<60, id: \.self) { index in
                let angle = Double(index) * 6.0
                let scale = soundDetectionViewModel.lineScales[index]
                
                Rectangle()
                    .foregroundStyle(soundDetectionViewModel.currentIndex == index ? .textLight : .accent)
                    .frame(width: 2, height: CGFloat(20) * scale)
                    .offset(y: -150)
                    .rotationEffect(.degrees(angle))
                    .animation(.easeInOut(duration: 1.0), value: scale)
            }
        }
    }
    
    var stopSheet: some View {
        VStack(spacing: 12) {
            Text("Закончить тренировку?")
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(.textLight)
            
            Button {
                withAnimation {
                    soundDetectionViewModel.showStopSheet = false
                }
            } label: {
                CustomButton(title: "Вернуться",
                             verticalPadding: 18)
            }
            .padding(.top, 24)
            
            Button {
                withAnimation {
                    soundDetectionViewModel.stopDetection()
                }
                if mailViewModel.canSendMail() {
                    mailViewModel.prepareMailContent(with: soundDetectionViewModel.intervals)
                    mailViewModel.isShowingMailView = true
                } else {
                    print("Mail services are not available")
                }
            } label: {
                CustomButton(title: "Отправить результат",
                             verticalPadding: 18)
            }
        }
        .padding(EdgeInsets(top: 43,
                            leading: 16,
                            bottom: 26,
                            trailing: 16))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.bgColorDark)
        )
        .padding(EdgeInsets(top: 0,
                            leading: 16,
                            bottom: 13,
                            trailing: 16))
        .background(.clear)
    }
}

#Preview {
    RecordingPracticeView()
}
