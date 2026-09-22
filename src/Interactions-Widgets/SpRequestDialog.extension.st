Extension { #name : 'SpRequestDialog' }

{ #category : '*Interactions-Widgets' }
SpRequestDialog class >> for: aRequest [

	^ (self newApplication: aRequest application owner: aRequest parentWindow)
		title: aRequest title;
		label: aRequest message;
		text: aRequest initialAnswer;
		validateAnswer: aRequest validationBlock;
		yourself
]
