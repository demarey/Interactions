"
I represent an information to be asked to the user.
I can be configured to be request a simple data, a password, use enttry completion.
"
Class {
	#name : 'ITRequest',
	#superclass : 'ITUserInteractionWithMessage',
	#instVars : [
		'initialAnswer',
		'validationBlock',
		'answerHeight',
		'entryCompletion'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'accessing' }
ITRequest >> answerHeight: anInteger [
	answerHeight := anInteger.
]

{ #category : 'accessing' }
ITRequest >> entryCompletion: anEntryCompletion [
	entryCompletion := anEntryCompletion
]

{ #category : 'accessing' }
ITRequest >> initialAnswer [
	^ initialAnswer
]

{ #category : 'accessing' }
ITRequest >> initialAnswer: aString [
	initialAnswer := aString
]

{ #category : 'private' }
ITRequest >> isValid: answer [
	^ validationBlock isNil 
		or: [ (validationBlock value: answer) not ]
]

{ #category : 'action' }
ITRequest >> multiLineRequest [
	^ UIManager default multiLineRequest: message 
		initialAnswer: initialAnswer
		answerHeight: answerHeight
]

{ #category : 'action' }
ITRequest >> request [
	^ (self backend widgetFor: self) openModal
]

{ #category : 'action' }
ITRequest >> requestPassword [
	| dialog |

	dialog := self backend widgetFor: self.
	dialog bePassword.
	^ dialog openModal
]

{ #category : 'action' }
ITRequest >> requestWithEntryCompletion [
	^ UIManager default
		request: message
		initialAnswer: initialAnswer
		entryCompletion: entryCompletion
]

{ #category : 'accessing' }
ITRequest >> validationBlock [
	^ validationBlock
]

{ #category : 'accessing' }
ITRequest >> validationBlock: aBlock [
	validationBlock := aBlock
]

{ #category : 'private' }
ITRequest >> widgetFor: aBackend [

	^ aBackend widgetForRequest: self
]
