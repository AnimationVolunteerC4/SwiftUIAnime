
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: Model
    @EnvironmentObject var colorTheme: ColorTheme
    
    @Namespace var namespace
    @Namespace var namespace1
    @Namespace var namespace2
    @Namespace var namespace3
    
    @State var hasScrolled = false
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    
    
    func getNamespace(index:Int) -> Namespace.ID {
        switch index {
        case 0:
            return namespace
        case 1:
            return namespace1
        case 2:
            return namespace2
        case 3:
            return namespace3
        default:
            return namespace
        }
    }
    
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                scrollDetection
                
                featured
                
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !show {
                    cards
                }
                
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
//                    if !show {
//                        cards
//                    } else {
//                        ForEach(courses) { course in
//                            Rectangle()
//                                .fill(.white)
//                                .frame(height: 300)
//                                .cornerRadius(30)
//                                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
//                                .opacity(0.3)
//                            .padding(.horizontal, 30)
//                        }
//                    }
//                }
//                .padding(.horizontal, 20)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(navTitle: "Featured", hasScrolled: $hasScrolled)
            )
            
            if show {
                detail
            }
        }
        .statusBar(hidden: !showStatusBar)
        .toolbar(showStatusBar ? .visible : .hidden, for: .navigationBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
        .onAppear {
            colorTheme.setToDark()
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
    
    var featured: some View {
        TabView {
            ForEach(featuredCourses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        )
                    
//                    Text("\(proxy.frame(in: .global).minX)")
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
    
    var cards: some View {
        ForEach(0..<courses.count, id: \.self) { index in
            C4CourseItem(namespace: getNamespace(index: index), course: courses[index], show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetails.toggle()
                        showStatusBar = false
                        selectedID = courses[index].id
                    }
            }
        }
    }
    
    var detail: some View {
        ForEach(0..<courses.count, id: \.self) { index in
            if courses[index].id == selectedID {
                CourseView(namespace: getNamespace(index: index), course: courses[index], show: $show)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                    removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(Model())
    }
}
