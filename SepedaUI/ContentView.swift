//
//  ContentView.swift
//  SepedaUI
//
//  Created by muhammad abdul latief on 03/02/21.
//

import SwiftUI

//model data
struct ProductModel: Identifiable {
    let id : Int
    let namaProduk : String
    let fotoProduk : String
    let hargaProduk : Int
    let lokasi : String
    let ratingCount : Int
    let jumlahRating : Int
    
    init(id: Int, namaProduk : String, fotoProduk : String, hargaProduk : Int, lokasi : String, ratingCount : Int, jumlahRating : Int) {
        self.id = id
        self.namaProduk = namaProduk
        self.fotoProduk = fotoProduk
        self.hargaProduk = hargaProduk
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
}

struct ContentView: View {
    
    let data: [ProductModel] = [
        ProductModel(id: 1, namaProduk: "Polygon XTrada", fotoProduk: "foto1", hargaProduk: 3400000, lokasi: "Kab. Banyuwangi", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 2, namaProduk: "Polygon Heist", fotoProduk: "foto2", hargaProduk: 3000000, lokasi: "Kab. Bogor", ratingCount: 5, jumlahRating: 50),
        ProductModel(id: 3, namaProduk: "Polygon Monarch", fotoProduk: "foto3", hargaProduk: 5000000, lokasi: "Kab. Brebes", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 4, namaProduk: "United Detroit", fotoProduk: "foto4", hargaProduk: 9000000, lokasi: "Kab. Pekalongan", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 5, namaProduk: "United Miami", fotoProduk: "foto5", hargaProduk: 9500000, lokasi: "Kab. Malang", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 6, namaProduk: "United Patrol", fotoProduk: "foto6", hargaProduk: 3000000, lokasi: "Kab. Banyumas", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 7, namaProduk: "Exotic M56", fotoProduk: "foto7", hargaProduk: 2500000, lokasi: "Kab. Tangerang", ratingCount: 5, jumlahRating: 56),
        ProductModel(id: 8, namaProduk: "Exotic J98", fotoProduk: "foto8", hargaProduk: 2000000, lokasi: "Jakarta", ratingCount: 2, jumlahRating: 86),
        ProductModel(id: 9, namaProduk: "Genio Xtrada", fotoProduk: "foto9", hargaProduk: 2500000, lokasi: "Bandung", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 10, namaProduk: "Pacific", fotoProduk: "foto10", hargaProduk: 5500000, lokasi: "Kab. Sumedang", ratingCount: 4, jumlahRating: 56)
    ]
    
    @State var jumlahKeranjang: Int = 0
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(data){ row in
                    VStack(spacing: 10){
                        Product(data: row, jumlahProduk: self.$jumlahKeranjang)
                    }
                    .padding()
                    
                }
            }
            .navigationBarTitle("Sepeda MTB")
            .navigationBarItems(
            trailing:
                HStack(spacing: 10){
                    
                    Button(action: {print()}){
                        Image(systemName: "envelope.fill")
                    }
                    
                    Button(action: {print()}){
                        Image(systemName: "bell.fill")
                    }
                    
                    keranjangView(jumlah: $jumlahKeranjang)
                    
                    Button(action: {print()}){
                        Image(systemName: "person.fill")
                    }
                    
                    
                    
                }
            )
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct keranjangView: View{
    
    @Binding var jumlah: Int
    
    var body: some View{
        ZStack{
            Button(action: {print()}){
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            Text("\(jumlah)")
                .foregroundColor(Color.white)
                .frame(width: 10, height: 10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x: 10, y: -10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product: View {
    
    let data: ProductModel
    
    @Binding var jumlahProduk: Int
    
    var body: some View{
        VStack(alignment: .leading){
            //foto
            ZStack(alignment:. topTrailing){
                Image(self.data.fotoProduk)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                Button(action: {print("Liked")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(.red)
                }
            }
            
            Text(self.data.namaProduk)
                .font(.title)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            Text("Rp. \(self.data.hargaProduk)")
                .font(.title)
                .bold()
                .foregroundColor(.red)
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top,2)
            
            HStack{
                HStack{
                    ForEach(0..<self.data.ratingCount){
                        items in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top,5)
            
            tambahKeranjang(jumlah: $jumlahProduk)
        }
        .background(Color("warna"))
        .cornerRadius(15)
    }
}

struct tambahKeranjang: View {
    
    @Binding var jumlah: Int
    
    var body: some View{
        Button(action: {self.jumlah += 1}){
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah ke keranjang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
    }
}
