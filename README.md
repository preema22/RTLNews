# RTLNews
Created by Preema DSouza

This project is implemented using Xcode 11.7, Swift 5 and a deployment target of 10.0+ and follows MVVM design pattern.
This project is about fetching and presenting an overview of news feed. It uses the pod SdWebImage to assist download of images. The project also provides a detailed article on click of a corresponding news feed.

Please open RTLNews.xcworkspace as opposed to RTLNews.xcodeproj due to existence of pod.

## View Controllers
There are two view controllers, **ArticlesViewController** and **ArticleDetailViewController**.

### ArticlesViewController
A _UICollectionViewController_ that contains the interface to present overview of the fetched news feed.

### ArticleDetailViewController
A _UITableViewViewController_ that presents a single news feed article in detail.

## Service
A singleton instance that is responsible for fetching news feed from the API.

## Models
There is one model: **Articles** 

### Articles
Decodable struct that represents news feed returned by the API

## Views

### ArticleCell
This is a _UICollectionViewCell_ which is responsible for displaying an article overview with the help of  **ArticleCellViewModel**.

### ArticleDetailCell
This is a _UITableViewCell_ which is responsible for displaying an article in detail with the help of  **ArticleDetaillViewModel**.

## ViewModels

### ArticlesViewModel
View Model for **ArticlesViewController**.

### ArticleViewModel
View Model for **ArticleCell**

### ArticleDetailViewModel
View Model for **ArticleDetailViewController**

## Tests

### ArticlesViewModelTests
Tests for _ArticlesViewModel_ validations

### ArticleViewModelTests
Tests for _ArticleViewModel_ validations

### ArticleDetailViewModelTests
Tests for _ArticleDetailViewModel_ validations
