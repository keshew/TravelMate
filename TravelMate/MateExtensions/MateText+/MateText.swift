import SwiftUI

extension Text {
    func FontRegular(size: CGFloat,
                     color: Color = .white)  -> some View {
        self.font(.custom("Poppins-Regular", size: size))
            .foregroundColor(color)
    }
    
    func FontSemiBold(size: CGFloat,
                      color: Color = .white)  -> some View {
        self.font(.custom("Poppins-SemiBold", size: size))
            .foregroundColor(color)
    }
    
    func FontBold(size: CGFloat,
                  color: Color = .white)  -> some View {
        self.font(.custom("Poppins-Bold", size: size))
            .foregroundColor(color)
    }
    
    func FontLight(size: CGFloat,
                   color: Color = .white)  -> some View {
        self.font(.custom("PoppinsLight", size: size))
            .foregroundColor(color)
    }
    func FontExtraBold(size: CGFloat,
                       color: Color = .white)  -> some View {
        self.font(.custom("Poppins-ExtraBold", size: size))
            .foregroundColor(color)
    }
    
    func FontMedium(size: CGFloat,
                       color: Color = .white)  -> some View {
        self.font(.custom("Poppins-Medium", size: size))
            .foregroundColor(color)
    }
}
