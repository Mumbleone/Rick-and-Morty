
# Rick and Morty

I made this app to test MVVM app architecture, creating collection views, and using the Rick and Morty API.

## Why MVVM?

I wanted to use MVVM because although I used UIKit, MVVM is more suited for SwiftUI. I feel MVVM works well with Combine's reactive nature. Although MVC can be adapted to its same purpose, I wanted to challenge myself to using a new app architecture.

## Model 

 The model is in charge of networking and defining the contract of data that can be used for the app. 
 I used structs to define the data contracts this can seen in Character.swift, Origin.swift, and Location.swift
The repository acts as an intermidiary between the viewmodel and the model. In a more complex app the repository would be in charge of fetching, caching, and saving data locally.

## ViewModel

The ViewModel talks to the model to retreive a list of characters. This is seen in the ViewModel.swift file. In addition, the ViewModel also maps and transforms the model layer objects into presentables for the view. The viewstate is an observeable object that the view can subscribe on. It represents the multiple states that a view may have and their respective data.

## View

The view is built using UIKit, utilizing UICollectionView, and Apple's new UICollectionViewDiffableDataSource.
In the viewDidLoad function, I am subscribing to the viewState variable, and loading the correct UI state depending on the enum. 

