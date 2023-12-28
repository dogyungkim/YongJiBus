import SwiftUI

struct HeaderView: View {
    
    private let title : String
    
    
    init(_ title : String = "" ){
        self.title = title
    }
    
    
    var body: some View {
        HStack{
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
        }//Hstack
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView("명지대역")
    }
}
