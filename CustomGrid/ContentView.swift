//
//  ContentView.swift
//  CustomGrid
//
//  Created by Adam Jemni on 6/8/22.
//

import SwiftUI
import ExyteGrid

let screen: CGSize = UIScreen.main.bounds.size

struct ContentView: View  {
    
    let imgStrings: [String] = ["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10","image11","image12","image13","image14","image15","image16","image17","image18","image19","image20"]
    
    var body: some View {
        
        Home(imgStrings: imgStrings, spacing: 2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    
    var size: CGFloat = (screen.width - 20) / 3
    let layoutImgStrings: [[String]]
    var spacing: CGFloat
    
    init(imgStrings: [String], spacing: CGFloat = 2){
        
        var layoutImgStrings = [[String]]()
        var tmp = [String]()
        
        for img in imgStrings {
            tmp.append(img)
            if tmp.count >= 3 {
                layoutImgStrings.append(tmp)
                tmp.removeAll()
            }
        }
        
        if !tmp.isEmpty{
            layoutImgStrings.append(tmp)
        }
        
        self.layoutImgStrings = layoutImgStrings
        self.spacing = spacing
    }
    
    var body: some View {
        
        
        GeometryReader { reader in
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: spacing) {
                    
                    let viewWidth: CGFloat = reader.size.width
                    
                    ForEach(layoutImgStrings.indices) { i in
                        
                        let imgStrings = layoutImgStrings[i]
                        
                        if i % 3 != 2 || imgStrings.count < 3 {
                            
                            Layout1(imgStrings: imgStrings, viewWidth: viewWidth, spacing: spacing)
                            
                        } else {
                            
                            if i % 2 == 0 {
                                
                                Layout2(imgStrings: imgStrings, viewWidth: viewWidth, spacing: spacing)
                                
                            } else {
                                
                                Layout3(imgStrings: imgStrings, viewWidth: viewWidth, spacing: spacing)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct Layout1: View {
    
    let imgStrings: [String]
    let viewWidth: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        
        let height: CGFloat = (viewWidth - (2 * spacing)) / 3
        
        return HStack (spacing: spacing) {
            
            ForEach(imgStrings, id: \.self) { imgStrings in
                Image(imgStrings)
                    .resizable()
                    .frame(width: height, height: height)
                    .scaledToFill()
            }
        }
        .frame(width: viewWidth, height: height, alignment: .leading)
        
    }
}

struct Layout2: View {
    
    let imgStrings: [String]
    let viewWidth: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        
        let smallItemWidth: CGFloat = (viewWidth - (2 * spacing)) / 3
        let height: CGFloat = smallItemWidth * 2 + spacing
        
        return HStack (spacing: spacing) {
            
            VStack(spacing: spacing) {
                
                Image(imgStrings[0])
                    .resizable()
                    .frame(width: smallItemWidth, height: smallItemWidth)
                    .scaledToFill()
                Image(imgStrings[1])
                    .resizable()
                    .frame(width: smallItemWidth, height: smallItemWidth)
                    .scaledToFill()
                
            }
            
            Image(imgStrings[2])
                .resizable()
                .frame(width: height, height: height)
                .scaledToFill()
            
        }
        .frame(height: height)
        
    }
}

struct Layout3: View {
    
    let imgStrings: [String]
    let viewWidth: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        
        let smallItemWidth: CGFloat = (viewWidth - (2 * spacing)) / 3
        let height: CGFloat = smallItemWidth * 2 + spacing
        
        return HStack (spacing: spacing) {
            
            Image(imgStrings[0])
                .resizable()
                .frame(width: height, height: height)
                .scaledToFill()
            
            VStack(spacing: spacing) {
                
                Image(imgStrings[1])
                    .resizable()
                    .frame(width: smallItemWidth, height: smallItemWidth)
                    .scaledToFill()
                Image(imgStrings[2])
                    .resizable()
                    .frame(width: smallItemWidth, height: smallItemWidth)
                    .scaledToFill()
                
            }
            
        }
        .frame(height: height)
        
    }
}
