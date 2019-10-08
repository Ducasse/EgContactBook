Class {
	#name : #EgContactBookPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter',
		'contactBook',
		'window'
	],
	#category : #EgContactBook
}

{ #category : #running }
EgContactBookPresenterTest >> setUp [ 

	super setUp.
	contactBook := EgContactBook new.
	contactBook addContact: (EgContact name: 'A Person' phone: '11223344' ).

	presenter := EgContactBookPresenter on: contactBook.
	presenter application: SpApplication new.
	window := presenter openWithSpec
]

{ #category : #running }
EgContactBookPresenterTest >> tearDown [

	presenter ifNotNil: [ :x | x application close ].
	super tearDown
]

{ #category : #running }
EgContactBookPresenterTest >> testWindowHasEntryList [

	self assert: (window hasPresenter: presenter table)
]
