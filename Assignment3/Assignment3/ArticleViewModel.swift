//
//  ArticleModel.swift
//  Assignment3
//
//  Created by 신종원 on 12/10/23.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var article = [ArticleModel]()
    
    func fetch() {
        guard let url = URL(string: "\(Constants.ARTICLE_API_ADDRESS)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil  else {return}
            
            do {
                let articles = try JSONDecoder().decode(Articles.self, from: data)
                
                DispatchQueue.main.async {
                    self?.article = articles.articles
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
