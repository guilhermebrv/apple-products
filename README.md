# apple-products

## About the app

I started developing this app as one of my initial explorations into iOS development, when I was beginning to discover UIKit. Despite the existence of the official Apple Store app, my aim was not to reinvent the wheel but to create a simplified catalog that allows users to browse Apple's device specifications and favorite products, while also putting my newly acquired knowledge into practice.

For this project, conceived at the same time as my quiz app, I found myself continually adding new features and refining the codebase, to consolidate my understanding and keep pace with the new content I had learned. Therefore, this app is more than just an utility for Apple enthusiasts; it's really part of my story becoming a better developer.

<img src="https://github.com/guilhermebrv/apple-products/assets/104163003/4f9c6277-b78c-4246-9c82-91d51d416deb" width="180" height="400" />
<img src="https://github.com/guilhermebrv/apple-products/assets/104163003/82219f36-4c38-4102-b66d-f2e7084f6a0c" width="180" height="400" />
<img src="https://github.com/guilhermebrv/apple-products/assets/104163003/ccacf2e0-b20e-44c0-a958-01423f9d4de7" width="180" height="400" />
<img src="https://github.com/guilhermebrv/apple-products/assets/104163003/5f127805-9424-4043-a635-c45e17473e61" width="180" height="400" />

## Technologies

UIKit • Auto Layout • URLSession • CoreData

## Key Features

- **MVVM Architecture:** Adopted for better manageability and separation of responsabilities.
  
- **Detailed Product Insights:** When choosing a product, a modal is launched filled with the device details and a direct link for purchases on the Apple website.

- **Products Catalog with Filtering:** This offers comprehensive navigation through Apple's product range, and I opted to use an UICollectionView for easy and interactive categorization. I also implemented an intuitive search functionality with a filtering method based on the selected device type, allowing users to quickly locate specific products.

- **Favorites Functionality with CoreData Integration:** This functionality allows users to build a wishlist by marking products as favorites. To make these preferences accessible offline, I've integrated CoreData for local storage, ensuring that users' choices are saved.
  
- **Tab Bar Navigation:** The app also features a Tab Bar interface, designed for making switching between products exploration and the wishlist easier.

## Challenges and Solutions

- While developing the app, a notable issue I faced was with reusing cells on the products' table view, where elements would sometimes appear in incorrect places, creating confusion when they changed unexpectedly after returning to a screen. This problem required a lot of debugging to ensure that the elements were correctly managed, and I ended up solving it simply with a method to reset the cells before each use.
‍
- One of the most time-consuming challenge was adding the filtering feature to help users find products more easily. This filter had to work together with the other for devices on the collection view, which made things a bit more complex. I ran into trouble multiple times when the app would crash because it tried to access indexes on the products table view that didn't exist. Thankfully, I had worked on a simpler version of this feature in an earlier project on a course I was doing, which helped me to remember more clearly how to fix the issues.

## What I learned

- It was my first time dealing with API calls, and handling data from outside sources, figuring out how to display it right, and making sure everything ran smoothly was challenging but super rewarding. Also, at the beginning, I was using UserDefaults for storing data, thinking it was simple and effective. But as the app was growing and I was discovering the best practices, I learned that CoreData was a much better choice for my needs. Making that transition taught me a lot about managing data more efficiently in iOS apps to make them run more smoothly, and to choose the right tools for the job.

## How to Use

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/guilhermebrv/apple-products.git

2. **Open in Xcode:**
- Launch the project in Xcode and run it on your preferred iOS simulator or device.

3. **Explore the App:**
- Browse through the catalog of Apple devices, using intuitive search and filter options to find exactly what you're looking for.
- Mark your favorite products for easy access later, all stored locally on your device for offline viewing.
- Dive into detailed product insights with just a tap, including specifications and direct links to purchase on the Apple website.


