"
(EgContactBookPresenter on: EgContactBook coworkers) openWithSpec
"
Class {
	#name : #EgContactBookPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'contactBook'
	],
	#category : #EgContactBook
}

{ #category : #specs }
EgContactBookPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical add: #table; yourself
]

{ #category : #accessing }
EgContactBookPresenter >> contactBook [
	^ contactBook
]

{ #category : #accessing }
EgContactBookPresenter >> initializePresenters [
	table := self newTable.
	table 
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Phone' evaluated: #phone).
	table items: contactBook contents.
]

{ #category : #accessing }
EgContactBookPresenter >> newContact [
	| rawData splitted |
	rawData := self 
		request: 'Enter new contact name and phone (split by comma)' 
		initialAnswer: '' 
		title: 'Create new contact'.
	splitted := rawData splitOn: $,.
	(splitted size = 2 and: [ splitted allSatisfy: #isNotEmpty ])
		ifFalse: [ SpInvalidUserInput signal: 'Please enter contact name and phone (split by comma)'  ].

	^ EgContact new
		name: splitted first;
		phone: splitted second;
		yourself
]

{ #category : #accessing }
EgContactBookPresenter >> setModelBeforeInitialization: aContactBook [

	super setModelBeforeInitialization: aContactBook.
	contactBook := aContactBook
]

{ #category : #accessing }
EgContactBookPresenter >> table [
	^ table
]

{ #category : #accessing }
EgContactBookPresenter >> table: anObject [
	table := anObject
]
