//
//  PostModel.swift
//  Navigation
//
//  Created by Olga Kislova on 13.01.2023.
//

import Foundation

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static func getPostsAboutCats() -> [Post] {
        [
            Post(
                author: "@BombayСat",
                description: "Кошка породы бомбей была выведена в 50-х годах 20 столетия в США настоящей поклонницей диких кошек Никки Хорнер.",
                image: "bombay-cat",
                likes: 123_789,
                views: 400_000
            ),
            Post(
                author: "@MaineCoonCat",
                description: "Родиной породы кошек мейн-кун является США, это типичная и одна из самых старейших пород кошек Америки.",
                image: "maine-coon-cat",
                likes: 177_782,
                views: 251_456
            ),
            Post(
                author: "@SiameseCat",
                description: "Эти кошки действительно долгое время считались священными животными и жили исключительно в храмах или во дворцах царских семей Таиланда.",
                image: "siamese-cat",
                likes: 451_455,
                views: 457_789
            ),
            Post(
                author: "@SnowShoeCat",
                description: "Название породы кошек сноу-шу или Snow shoe переводится как «снежный башмачок», она была выведена в США в 60-х годах 20 столетия. ",
                image: "snow-shoe-cat",
                likes: 140_777,
                views: 145_789
            )
        ]
    }
 }
