//
//  ContentView.swift
//
//  Created by Igor Dourado  on 28/03/23.
//

import SwiftUI

struct Movie{
    var name : String
    var poster : Image
    var description : Text
    var rating : String
    var genero : String
}

func sorterayx(this: Movie, that:Movie) -> Bool { // Comparator para ordenar por nota
    return this.rating > that.rating
}

func ordena(mov: [Movie]) -> [Movie]{ // Vai ordenar por nota para exibir os mais com maiores notas em ordem no popular movies
    var mov = mov
    mov.sort(by: sorterayx(this:that:))
    return mov
}

struct FirstView: View  {
    var mov : Movie
    
    init(mov: Movie? = nil) {
           
        self.mov = mov!
           
       }
    var body: some View {
        
        ScrollView{
            VStack{
                HStack{
                    
                    mov.poster
                        .resizable()
                        .scaledToFit()
                        .frame(width: 145)
                        .cornerRadius(14)
                    Spacer()
                    VStack{
                        Spacer()
                        HStack{
                            Text(mov.name).bold().font(.title3)
                            Spacer()
                        }
                        Text("")
                        
                        HStack{
                            Text(mov.genero).font(.custom("X", size: 18)).lineLimit(3).foregroundColor(.gray)
                            Spacer()
                        }
                        Text("")
                        
                        HStack(){
                            Image(systemName: "star")
                            Text(mov.rating)
                            Spacer()
                        }.foregroundColor(.gray).font(.subheadline)

                    }.padding(.vertical)
                    
                }.padding(.vertical)
                HStack{
                    Text("Overview\n").bold()
                    Spacer()
                }
                HStack{
                    mov.description.foregroundColor(.secondary)
                    Spacer()
                }
            }.padding(.leading)
        }
        Spacer()
            .navigationTitle("Movie Details")
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            
        //Spacer()
    }
}



struct ContentView: View {
    
    
    
    var listMovies = [Movie(name: "Tudo em Todo o Lugar ao Mesmo Tempo", poster: Image("TudoEmTodoLugar"), description: Text("Uma imigrante chinesa parte rumo a uma aventura onde, sozinha, precisará salvar o mundo, explorando outros universos e outras vidas que poderia ter vivido. Contudo, as coisas se complicam quando ela fica presa nessa infinidade de possibilidades sem conseguir retornar para casa." ), rating: "7.9", genero: "Ação, Aventura, Ficção científica"), Movie(name: "Avatar: O Caminho da Água", poster: Image("Avatar"), description: Text("12 anos depois de explorar Pandora e se juntar aos Na'vi, Jake Sully formou uma família com Neytiri e se estabeleceu entre os clãs do novo mundo. Porém, a paz não durará para sempre." ), rating: "7.7", genero: "Ficção científica, Aventura, Ação"), Movie(name: "The Last Of Us", poster: Image("TLOU"), description: Text("Situado duas décadas após a implosão de nossa sociedade, o drama seguirá Joel, um sobrevivente difícil, que é contratado para contrabandear uma garota de 14 anos chamada Ellie para fora de uma zona de quarentena opressiva. O que começa como um pequeno trabalho logo se torna uma jornada brutal e de partir o coração, já que os dois precisam atravessar os Estados Unidos e dependem um do outro para sobreviver."), rating: "8.8", genero: "Drama"), Movie(name: "John Wick 4: Baba Yaga", poster: Image("JohnWick"), description: Text("Com o preço por sua cabeça cada vez maior, John Wick leva sua luta contra a alta mesa global enquanto procura os jogadores mais poderosos do submundo, de Nova York a Paris, de Osaka a Berlim." ), rating: "8.2", genero: "Ação, Thriller, Crime"), Movie(name: "Shazam! Fúria dos Deuses", poster: Image("Shazam"), description: Text("Continua a história do adolescente Billy Batson que, ao recitar a palavra mágica “SHAZAM!”, é transformado em seu alto ego adulto de super-herói, Shazam." ), rating: "6.9", genero: "Ação, Comédia, Fantasia"), Movie(name: "As Múmias e o Anel Perdido", poster: Image("AsMumias"), description: Text("Acompanha as divertidas aventuras de três múmias egípcias que vivem numa cidade secreta subterrânea sob as pirâmides do antigo Egito – uma princesa, um piloto de corrida de bigas e o irmão mais novo dele, inseparável de seu bebê crocodilo de estimação. Após uma série de infelizes acasos, o trio de múmias e seu pet embarcam numa hilária e agitada jornada na Londres atual à procura de um anel ancestral, de propriedade da Família Real das Múmias, roubado pelo ambicioso arqueólogo Lorde Carnaby." ), rating: "6.6", genero: "Animação, Comédia, Família"), Movie(name: "Wandinha", poster: Image("Wandinha"), description: Text("Inteligente, sarcástica e apática, Wandinha Addams pode estar meio morta por dentro, mas na Escola Nunca Mais ela vai fazer amigos, inimigos e investigar assassinatos." ), rating: "8.6", genero: "Ficção científica & Fantasia, Mistério, Comédia")]
    
    
    
    @State private var search = ""
    var body: some View {
        
        
        NavigationStack(){
            
            
            Divider()
                .navigationTitle("MovieDB")
            
            
            ScrollView{
                HStack{
                    Text("Now playing")
                        .bold()
                        .font(.title3)
                        .padding(.leading)
                    Spacer()
                    Text("See all")
                        .font(.callout)
                        .foregroundColor(.gray)
                        .padding(.leading)
                }.padding(.minimum(10, 10))
                ScrollView(.horizontal, showsIndicators: false){
                    NavigationStack(){
                        
                            HStack(spacing: 12){
                                
                                ForEach(listMovies, id: \.name) { mov in
                                    NavigationLink(destination: FirstView(mov: mov)){
                                    VStack(alignment: .leading){
                                        mov.poster
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 145)
                                            .cornerRadius(13)
                                        HStack{
                                            Text((mov.name.count < 15) ?
                                                 mov.name : mov.name[mov.name.startIndex...mov.name.index(mov.name.startIndex, offsetBy: 13)] + "..." ).bold()
                                            
                                        }
                                        HStack{
                                            Image(systemName: "star")
                                            Text(mov.rating)
                                        }.foregroundColor(.gray).font(.footnote)
                                        
                                    }
                                }
                                }
                                
                                
                            }
                        
                    }.padding(.leading).foregroundColor(.black)
                }
                Divider()
                    .padding(20)
                HStack{
                    Text("Popular Movies").bold()
                    Spacer()
                }.padding(.horizontal)
                
                ScrollView{
                    ForEach(ordena(mov: listMovies), id: \.name) { mov in //Considera como //os filmes com maiores notas e os ordernam em ordem descrescente
                        HStack{
                            mov.poster
                                .resizable()
                                .scaledToFit()
                                .frame(width: 95)
                                .cornerRadius(14)
                            VStack{
                                HStack{
                                    Text(mov.name).bold().font(.headline)
                                    Spacer()
                                }
                                Text("")
                                mov.description.font(.footnote).lineLimit(3).foregroundColor(.gray)
                                Text("")
                                HStack(){
                                    Image(systemName: "star")
                                    Text(mov.rating)
                                    Spacer()
                                }.foregroundColor(.gray).font(.footnote)
                                    
                            }
                            
                        }
                    }
                }.padding(.leading)
                
            }

        }
        .searchable(text: $search)
        .padding(.vertical)
        .ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
