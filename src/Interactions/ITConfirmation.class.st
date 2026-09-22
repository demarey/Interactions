"
I represent a user interaction to confirm an intent.
I can be canceled, approved or denied.
My actions labels can be customized.
"
Class {
	#name : 'ITConfirmation',
	#superclass : 'ITUserInteractionWithMessage',
	#instVars : [
		'cancelLabel',
		'cancelBlock',
		'falseLabel',
		'trueLabel',
		'defaultChoice'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'example' }
ITConfirmation class >> example [
	^ self new
		message: 'I''m a reification of a confirmation to be delivered to the user';
		title: 'ITConfirmation example';
		yourself
]

{ #category : 'accessing' }
ITConfirmation >> cancelBlock: aBlock [
	cancelBlock := aBlock
]

{ #category : 'accessing' }
ITConfirmation >> cancelLabel [
	^ cancelLabel ifNil: [ cancelLabel := 'cancel' ]
]

{ #category : 'accessing' }
ITConfirmation >> cancelLabel: aString [
	cancelLabel := aString
]

{ #category : 'action' }
ITConfirmation >> confirm [
	^ (self backend widgetFor: self) openModal
]

{ #category : 'action' }
ITConfirmation >> confirmWithCancelBlock [
	^ (self backend widgetFor: self) openModal
]

{ #category : 'accessing' }
ITConfirmation >> defaultChoice [
	^ defaultChoice
]

{ #category : 'accessing' }
ITConfirmation >> defaultChoice: aSymbol [
	#(#true #false #nil) 
		detect: aSymbol ifNone: [ self error: aSymbol, ' is not a valid choice!' ].
		
	defaultChoice := aSymbol
]

{ #category : 'accessing' }
ITConfirmation >> noLabel [
	^ falseLabel ifNil: [ falseLabel := 'no' ]
]

{ #category : 'accessing' }
ITConfirmation >> noLabel: aString [
	falseLabel := aString
]

{ #category : 'action' }
ITConfirmation >> proceed [
	^ (self backend widgetFor: self) openModal
]

{ #category : 'action' }
ITConfirmation >> question [
	^ (self backend widgetFor: self) openModal
]

{ #category : 'action' }
ITConfirmation >> questionWithoutCancel [
	^ (self backend widgetFor: self) openModal
]

{ #category : 'private' }
ITConfirmation >> widgetFor: aBackend [

	^ aBackend widgetForConfirmation: self
]

{ #category : 'accessing' }
ITConfirmation >> yesLabel [
	^ trueLabel ifNil: [ trueLabel := 'yes' ]
]

{ #category : 'accessing' }
ITConfirmation >> yesLabel: aString [
	trueLabel := aString
]
