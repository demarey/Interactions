Extension { #name : 'SpSelectDialog' }

{ #category : '*Interactions-Widgets' }
SpSelectDialog class >> for: aUIChoice [

	^ (self newApplication: aUIChoice application owner: aUIChoice parentWindow)
		title: aUIChoice title;
		label: aUIChoice message;
		items: aUIChoice items;
		display: [ :item | (aUIChoice displayBlock value: (Array with: item)) first ];
		yourself
]
