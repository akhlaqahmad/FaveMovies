# FaveMovies

FaveMovies is an iOS application for discovering popular movies from [The Movie Database](https://www.themoviedb.org/). It uses a modular architecture with a network layer powered by [Moya](https://github.com/Moya/Moya) and maps responses into Swift models with [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper).

## Features
- Fetches movie lists and details from the TMDB API through a shared API manager
- Infinite scrolling and pull-to-refresh on the movie list
- Skeleton loading placeholders while data is loading
- Detailed movie view with images, genres, language, synopsis and a booking link

## Requirements
- Xcode 11 or later
- iOS 13.0+
- [CocoaPods](https://cocoapods.org/)

## Installation
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd FaveMovies
   ```
2. Install dependencies:
   ```bash
   pod install
   ```
3. Open `FaveMovies.xcworkspace` in Xcode.
4. Build and run the app on a simulator or device.

The TMDB API key is defined in `AppConstants.swift` and can be replaced if needed.

## Project Structure
- `Application` – Application entry points and configuration.
- `Models` – Data models for movies and responses.
- `Network` – `APIManager` and `APIProvider` for interacting with the TMDB API.
- `Stories` – UI modules for the movie list and movie detail screens.
- `Storyboards` – Interface Builder storyboards.
- `Utilities` – Constants and helper extensions.

## Dependencies
Dependencies are managed with CocoaPods and include:
- Moya
- ObjectMapper
- SkeletonView
- ReachabilitySwift
- SDWebImage
- UIScrollView-InfiniteScroll
- AMRefresher

## Testing
Run the test suite with Xcode or from the command line:
```bash
xcodebuild test -workspace FaveMovies.xcworkspace -scheme FaveMovies -destination 'platform=iOS Simulator,name=iPhone 11'
```

## License
This project is provided as-is for educational purposes.
