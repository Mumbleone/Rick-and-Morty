
I made this app to test MVVM app architecture, creating collection views, and using the Rick and Morty API.


Explain
 The ViewModel.swift file changes the viewstate and according to which ever view state option it is, gives characters to the views. The ViewController.swift maps the characters recieved from the viewmodel to the views that are created and is then presented to the screen. In ViewController.swift is where the collection view is also created. The individual cells for the collection view is in the Cells.swift file.

The CharacterSource.swift gets the characters image and character's name from the Rick and Morty API.

Model files
CharacterSource

Character
Origin
Location
These files create the model contracts to respresent each character from the API
Repository
This file provide a list of the characters to give to the ViewModel
ViewModel

