"
I represent an interaction where I ask the user to choose between different values.
Values are provided with a collection of objects.
"
Class {
	#name : 'ITUIChoice',
	#superclass : 'ITUserInteractionWithMessage',
	#instVars : [
		'items',
		'displayBlock'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'accessing' }
ITUIChoice >> displayBlock [
	^ displayBlock
]

{ #category : 'accessing' }
ITUIChoice >> displayBlock: aBlock [ 
	displayBlock := aBlock 
]

{ #category : 'initialization' }
ITUIChoice >> initialize [ 
	displayBlock := [ :item | item name ]
]

{ #category : 'accessing' }
ITUIChoice >> items [
	^ items
]

{ #category : 'accessing' }
ITUIChoice >> items: aCollection [
	items := aCollection
]

{ #category : 'private' }
ITUIChoice >> widgetFor: aBackend [

	^ aBackend widgetForUIChoice: self
]

{ #category : 'running' }
ITUIChoice >> run [
	UIManager default
		chooseFrom: (displayBlock value: items)
		values: items
		lines: #()
		message: message
		title: title
]
