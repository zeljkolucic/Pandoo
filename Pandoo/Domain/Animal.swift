//
//  Animal.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 27.1.23..
//

import Foundation

public class Animal {
    public let name: String
    public let latinName: String
    public let description: String
    public let imageName: String
    public var numberOfLikes: Int
    public var comments: [Comment]
    
    init(name: String, latinName: String, description: String, imageName: String, numberOfLikes: Int, comments: [Comment]) {
        self.name = name
        self.latinName = latinName
        self.description = description
        self.imageName = imageName
        self.numberOfLikes = numberOfLikes
        self.comments = comments
    }
    
    public static var animals: [Animal] = [
        Animal(
            name: "Elephant",
            latinName: "Loxodonta",
            description: "Elephant, (family Elephantidae), largest living land animal, characterized by its long trunk (elongated upper lip and nose), columnar legs, and huge head with temporal glands and wide, flat ears. Elephants are grayish to brown in colour, and their body hair is sparse and coarse. They are found most often in savannas, grasslands, and forests but occupy a wide range of habitats, including deserts, swamps, and highlands in tropical and subtropical regions of Africa and Asia.",
            imageName: "Elephant",
            numberOfLikes: 127,
            comments: []
        ),
        Animal(
            name: "Lion",
            latinName: "Panthera leo",
            description: "Lions have strong, compact bodies and powerful forelegs, teeth and jaws for pulling down and killing prey. Their coats are yellow-gold, and adult males have shaggy manes that range in color from blond to reddish-brown to black. The length and color of a lion's mane is likely determined by age, genetics and hormones. Young lions have light spotting on their coats that disappears as they grow. Without their coats, lion and tiger bodies are so similar that only experts can tell them apart.",
            imageName: "Lion",
            numberOfLikes: 180,
            comments: []
        ),
        Animal(
            name: "Brown Bear",
            latinName: "Ursus arctos",
            description: "The brown bear has a slight hump above its shoulder, round ears, a long snout and big paws with long, curved claws that it uses for digging. Unlike the black bear, it can't climb trees. It can weigh between 350-1,500 pounds. When standing on its hind legs it can be up to 5 feet tall. Males are larger than females. The brown bear is not always brown. It has fur that ranges from a cream or silver color to an almost black color.",
            imageName: "Brown bear",
            numberOfLikes: 199,
            comments: []
        ),
        Animal(
            name: "Macaw parrot",
            latinName: "Ara macao",
            description: "Macaws are typically large, brightly colored parrots with long tail feathers. The characteristic that distinguishes macaws from other members of the parrot family is their bare facial areas that vary in size and pattern according to different species. Macaws range in size from the 30 cm (12 in.) Hahn's macaw (Ara nobilis nobilis) to the largest of all parrots, the hyacinth macaw (Anodorhynchus hyacinthinus), which can reach a size of approximately 102 cm (40 in.).",
            imageName: "Macaw parrot",
            numberOfLikes: 84,
            comments: []
        ),
        Animal(
            name: "Giraffe",
            latinName: "Giraffa",
            description: "The tallest land mammal, with a neck as long as 6 feet, the giraffe is also well known for the unique brown and white pattern on its coat (“pelage”) and its lengthy eyelashes and legs. Habitat: Giraffes use both semi-arid savannah and savannah woodlands in Africa. These tip-top creatures stand in at 18 ft. tall, with a record height for the males of 19.3 ft. They have long legs, long necks, and relatively short bodies. Their heads are topped with bony horns, and their tails are tipped with a tuft of fur.",
            imageName: "Giraffe",
            numberOfLikes: 211,
            comments: []
        ),
        Animal(
            name: "Tiger",
            latinName: "Panthera tigris altaica",
            description: "Tigers have reddish-orange coats with prominent black stripes, white bellies and white spots on their ears. Like a human fingerprint, no two tigers have the exact same markings. Because of this, researchers can use stripe patterns to identify different individuals when studying tigers in the wild. Tigers are powerful hunters with sharp teeth, strong jaws and agile bodies. They are the largest terrestrial mammal whose diet consists entirely of meat. The tiger's closest relative is the lion.",
            imageName: "Tiger",
            numberOfLikes: 192,
            comments: []
        ),
        Animal(
            name: "Dolphin",
            latinName: "Delphinidae",
            description: "Dolphins have smooth skin, flippers, and a dorsal fin. They have a long, slender snout with about 100 teeth, and a streamlined body. The single blowhole on top of their head has a flap that opens to reveal a pair of nostrils, which dolphins use for breathing when they surface. Ever wondered how dolphins sleep and get air to breathe at the same time? It would seem that if they fall asleep in the ocean, they'd sink, and then they wouldn’t be able to breathe!",
            imageName: "Dolphin",
            numberOfLikes: 234,
            comments: []
        ),
        Animal(
            name: "Arctic wolf",
            latinName: "Canis lupus arctos",
            description: "The Artic wolf is a subspecies of grey wolf with a distinct white coat. This coat color is not unknown among other wolf subspecies, but nearly all Arctic wolves are white, which differs greatly from any other wolf subspecies. Arctic wolves are one of a whopping 38 subspecies of grey wolves, each with its own unique appearance, range, and behavior. Read on to learn about the Arctic wolf.",
            imageName: "White wolf",
            numberOfLikes: 234,
            comments: []
        )
    ]
}

public struct Comment {
    public let user: User
    public let text: String
    public let date: Date
    
    var timestamp: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        return dateFormatter.string(from: date)
    }
}
