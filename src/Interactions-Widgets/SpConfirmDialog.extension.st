Extension { #name : 'SpConfirmDialog' }

{ #category : '*Interactions-Widgets' }
SpConfirmDialog class >> for: aConfirmation [

	^ (self newApplication: aConfirmation application owner: aConfirmation parentWindow)
		  title: aConfirmation title;
		  message: aConfirmation message;
		  acceptLabel: aConfirmation yesLabel;
		  cancelLabel: aConfirmation noLabel;
		  yourself
]
