Class {
	#name : #EgContactCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'cm'
	],
	#category : #EgContactBook
}

{ #category : #tests }
EgContactCommandTest >> testContactBook [
	| presenter |
	presenter := (EgContactBookPresenter on: EgContactBook coworkers).
	cm := EgContactBookCommand new context: presenter.
	self assert: cm contactBook == presenter contactBook
]

{ #category : #tests }
EgContactCommandTest >> testContactBookPresenter [
	| presenter |
	presenter := (EgContactBookPresenter on: EgContactBook coworkers).
	cm := EgContactBookCommand new context: presenter.
	self assert: cm contactBookPresenter equals: presenter
]

{ #category : #tests }
EgContactCommandTest >> testSelectedContact [

	| presenter item |
	presenter := (EgContactBookPresenter on: EgContactBook coworkers).
	presenter table selectIndex: 1.
	item := presenter selectedContact.  
	cm := EgContactBookCommand new context: presenter.
	self assert: cm selectedContact equals: item
]
