Class {
	#name : #EgContactCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'cm',
		'presenter'
	],
	#category : #EgContactBook
}

{ #category : #tests }
EgContactCommandTest >> setUp [
	
	presenter := EgContactBookPresenter on: EgContactBook coworkers.
	cm := EgContactBookCommand new context: presenter.
	^ presenter
]

{ #category : #tests }
EgContactCommandTest >> testContactBook [

	self assert: cm contactBook == presenter contactBook
]

{ #category : #tests }
EgContactCommandTest >> testContactBookPresenter [

	self assert: cm contactBookPresenter equals: presenter
]

{ #category : #tests }
EgContactCommandTest >> testHasSelectedContract [
	| item |
	presenter table selectIndex: 1.
	item := presenter selectedContact.
	self assert: cm hasSelectedContact
]

{ #category : #tests }
EgContactCommandTest >> testSelectedContact [

	|  item |
	presenter table selectIndex: 1.
	item := presenter selectedContact.  
	self assert: cm selectedContact equals: item
]
