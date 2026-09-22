Class {
	#name : 'SpecInteractionTest',
	#superclass : 'TestCase',
	#instVars : [
		'backend',
		'widget'
	],
	#category : 'Interactions-Tests',
	#package : 'Interactions-Tests'
}

{ #category : 'running' }
SpecInteractionTest >> setUp [
	super setUp.

	backend := SpecInteraction default
]

{ #category : 'running' }
SpecInteractionTest >> tearDown [ 
	widget ifNotNil: [ :w | w delete ].
	super tearDown
]

{ #category : 'tests' }
SpecInteractionTest >> testCanOpenAConfirmation [

	| confirm window |
	confirm := ITConfirmation new
		title: 'Remove File';
		message: 'Are you sure you want to delete this file?';
		yesLabel: 'delete'.
		
	widget := backend widgetFor: confirm.
	widget doInteraction. 
	
	window := widget window.
	self assert: window title equals: confirm title.
	self assert: widget label equals: confirm message.
	self assertCollection: (window buttons collect: #label) hasSameElements: #('no' 'delete')
]

{ #category : 'tests' }
SpecInteractionTest >> testCanOpenAFileRequest [

	| fileRequest window |
	fileRequest := ITFileRequest new
		title: 'Image file to open?';
		filter: '.image';
		currentFolder: FileLocator home.
		
	widget := backend widgetFor: fileRequest.
	widget open.
	
	window := widget window.
	self assert: window title equals: fileRequest title.
	self assert: widget fileNavigationSystem filtersDropList selectedItem basename equals: '.image'.
	self assert: widget fileNavigationSystem currentDirectory equals: FileLocator home.
]

{ #category : 'tests' }
SpecInteractionTest >> testCanOpenARequest [

	| request window |
	request := ITRequest new
		title: 'Image name';
		message: 'Please enter a name:';
		initialAnswer: 'MyImage';
		validationBlock: [ :text | text isNotNil and: [ text trimBoth isNotEmpty ] ];
		yourself.

	widget := backend widgetFor: request.
	widget doInteraction.

	window := widget window.
	self assert: window title equals: request title.
	self assert: widget label equals: request message.
	self assert: widget textInputPresenter text equals: request initialAnswer
]

{ #category : 'tests' }
SpecInteractionTest >> testCanOpenAUIChoice [

	| choice window |
	choice := ITUIChoice new
		title: 'Select a template';
		message: 'Which template do you want?';
		items: #( foo bar );
		displayBlock: [ :value | value asString ];
		yourself.

	widget := backend widgetFor: choice.
	widget doInteraction.

	window := widget window.
	self assert: window title equals: choice title.
	self assert: widget getLabel equals: choice message
]

{ #category : 'tests' }
SpecInteractionTest >> testCanOpenAnInformation [

	| inform window |
	inform := ITInformation new
		title: 'Some confirmation needed';
		message: 'Do you want to proceed?'.
		
	widget := backend widgetFor: inform.
	widget doInteraction. 
	
	window := widget window.
	self assert: window title equals: inform title.
	self assert: widget label equals: inform message.
	self assertCollection: (window buttons collect: #label) hasSameElements: #('Ok')
]

{ #category : 'tests' }
SpecInteractionTest >> testCanSelectAFile [

	| fileRequest fs file bImage |
	fs := FileSystem memory.
	(fs root / 'a.image') ensureCreateFile.
	bImage := (fs root / 'b.image') ensureCreateFile.
	fileRequest := ITFileRequest new
		title: 'Image file to open?';
		filter: '.image';
		currentFolder: fs root;
		yourself.
		
	widget := backend widgetFor: fileRequest.
	widget doInteraction.
	widget selectFile: bImage.
	file := widget confirm.
	
	self assert: widget fileNavigationSystem currentDirectory equals: fs root.
	self assert: file equals: bImage
]

{ #category : 'tests' }
SpecInteractionTest >> testCanSelectAFolder [

	| fileRequest fs folder bFolder |
	fs := FileSystem memory.
	(fs root / 'a') ensureCreateDirectory.
	bFolder := (fs root / 'b') ensureCreateDirectory.
	fileRequest := ITFileRequest new
		beForFolderOpening;
		title: 'Folder to open?';
		currentFolder: fs root;
		yourself.
		
	widget := backend widgetFor: fileRequest.
	widget doInteraction.
	widget selectFile: bFolder.
	folder := widget confirm.
	
	self assert: widget fileNavigationSystem currentDirectory equals: fs root.
	self assert: folder equals: bFolder
]
