import SwiftUI

struct ProfileView: View {
    var nickname: String
    var selectedRole: String
    var attack: Int
    var HP: Int
    var MP: Int
    var body: some View {
        VStack {
            NavigationView{
                ScrollView{
                    VStack{
                        Image("The_Unforger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130, height: 130)
                            .cornerRadius(100)
                            .padding(22)
                            .padding(.top, -80)
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.blue)
                            .offset(x:65, y: -100)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
//                    tes
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    VStack{
                        if selectedRole == "Mage" {
                            Image("mage_role")
                            
                        } else if selectedRole == "Assassin" {
                            Image("assassin_role")
                        } else {
                            Image("fighter_role")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    Text("Your Skill")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x:-130, y: 70)
                    HStack{
                        Image("The_Unforger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 250)
                            .cornerRadius(22)
                            .offset(x:-0 ,y:30)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .offset(x:-0 ,y:30)
                        Image("The_Unforger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 250)
                            .cornerRadius(22)
                            .offset(x:-0 ,y:30)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .offset(x:-0 ,y:30)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    HStack{
                        Image("The_Unforger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 250)
                            .cornerRadius(22)
                            .offset(x:-0 ,y:30)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .offset(x:-0 ,y:30)
                        Image("The_Unforger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 250)
                            .cornerRadius(22)
                            .offset(x:-0 ,y:30)
                            .shadow(color: .black.opacity(0.2), radius: 11)
                            .offset(x:-0 ,y:30)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                
            }
        }
    }
    
}
