import SwiftUI

struct TrashPageListView: View {
    @State private var isExpanded = false

    var body: some View {
        ZStack {
            // Black background
            Color.black.ignoresSafeArea()
            
            // Blurred background image
            Image("background")
                .resizable()
                .scaledToFit()
                .frame(width: 380, height: 380)
                .blur(radius: 8)
                .opacity(0.95)
                .allowsHitTesting(false)
            
            VStack {
                Spacer()
                // Trash bin image
                Image("trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .shadow(color: .black.opacity(0.15), radius: 12, y: 8)
                
                // List with interactive rows
                List {
                    // Date row
                    Text("2월 24일")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color(red: 71/255, green: 81/255, blue: 97/255))
                        .listRowBackground(Color.white)
                    
                    // Expandable row
                    if !isExpanded {
                        HStack {
                            Text("누른 횟수")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(Color(red: 71/255, green: 81/255, blue: 97/255))
                            Spacer()
                            Text("10")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(Color(red: 71/255, green: 81/255, blue: 97/255))
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    isExpanded = true
                                }
                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(red: 71/255, green: 81/255, blue: 97/255))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .buttonStyle(.plain)
                        }
                        .listRowBackground(Color(red: 243/255, green: 246/255, blue: 250/255))
                    } else {
                        HStack(alignment: .top) {
                            Text("오늘 회사 상사 때문에 진짜 회사 때려부수고 감옥 한번 갈뻔함 ;; 나니까 참는다")
                                .font(.system(size: 16))
                                .foregroundColor(Color(red: 71/255, green: 81/255, blue: 97/255))
                                .padding(.vertical, 8)
                            Spacer()
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    isExpanded = false
                                }
                            }) {
                                Image(systemName: "chevron.up")
                                    .foregroundColor(Color(red: 71/255, green: 81/255, blue: 97/255))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .buttonStyle(.plain)
                        }
                        .listRowBackground(Color(red: 243/255, green: 246/255, blue: 250/255))
                    }
                }
                .frame(height: isExpanded ? 160 : 100)
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .cornerRadius(12)
                .padding(.horizontal, 24)
                
                //Spacer()
                Button(action: {
                    // Add your navigation or action here
                }) {
                    Text("Home")
                        .font(.system(size: 38, weight: .bold, design: .monospaced)) // pixel/monospaced style
                        .foregroundColor(.white)
                        .frame(width: 180, height: 60) // Fixed smaller width and height
                        .background(
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .fill(Color(red: 0.63, green: 0.10, blue: 0.10)) // #A11A1A
                        )
                }
                .padding(.top,120)
                .padding(.bottom, 28)

                                
                                
                
                
            }
        }
        .navigationBarBackButtonHidden(true) // <--- Hides the "<Back" button
            
    }
}

#Preview {
    TrashPageListView()
}
