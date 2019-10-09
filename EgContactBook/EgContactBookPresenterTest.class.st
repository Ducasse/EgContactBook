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
	EgContactBook reset.
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
EgContactBookPresenterTest >> testIsContactSelected [

	presenter table selectIndex: 1.
	self assert: presenter isContactSelected
]

{ #category : #running }
EgContactBookPresenterTest >> testSelectedItem [

	presenter table selectIndex: 1.
	self assert: presenter selectedContact equals: presenter contactBook contacts first
]

{ #category : #running }
EgContactBookPresenterTest >> testStartsWithoutSelection [

	self assert: presenter table selection isEmpty
]

{ #category : #running }
EgContactBookPresenterTest >> testWindowHasEntryList [

	self assert: (window hasPresenter: presenter table)
]

{ #category : #running }
EgContactBookPresenterTest >> testWindowTitle [

	self assert: window title equals: 'Pharo Contact Book'.
]
