"
(EgContactBookPresenter on: EgContactBook coworkers) openWithSpec
"
Class {
	#name : #EgContactBookPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'contactBook',
		'menuBar'
	],
	#category : #EgContactBook
}

{ #category : #menus }
EgContactBookPresenter class >> buildAddingGroupWith: presenter [
	^ (CmCommandGroup named: 'Adding') asSpecGroup
		description: 'Commands related to contact addition.';
		register: (EgAddContactCommand forSpec context: presenter);
		beDisplayedAsGroup;
		yourself
]

{ #category : #menus }
EgContactBookPresenter class >> buildCommandsGroupWith: presenter 
	forRoot: rootCommandGroup [
	
	rootCommandGroup
		register: (self buildMenuBarGroupWith: presenter);
		register: (self buildContextualMenuGroupWith: presenter)
]

{ #category : #menus }
EgContactBookPresenter class >> buildContextualMenuGroupWith: presenter [
	^ (CmCommandGroup named: 'Context Menu') asSpecGroup
		register: (self buildAddingGroupWith: presenter);
		register: (self buildRemovingGroupWith: presenter);
		yourself
]

{ #category : #menubar }
EgContactBookPresenter class >> buildMenuBarGroupWith: presenter [
	^ (CmCommandGroup named: 'MenuBar') asSpecGroup
		register: (EgPrintContactCommand forSpec);
		yourself
		
]

{ #category : #menus }
EgContactBookPresenter class >> buildRemovingGroupWith: presenter [
	^ (CmCommandGroup named: 'Removing') asSpecGroup
		description: 'Commands related to contact removal.';
		register: (EgRemoveContactCommand forSpec context: presenter);
		beDisplayedAsGroup;
		yourself
]

{ #category : #specs }
EgContactBookPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical add: #table; yourself
]

{ #category : #accessing }
EgContactBookPresenter >> contactBook [
	^ contactBook
]

{ #category : #initialization }
EgContactBookPresenter >> initializePresenters [
	table := self newTable.
	table 
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Phone' evaluated: #phone).
	
	table contextMenu: [ (self rootCommandsGroup) beRoot asMenuPresenter ].
	table items: contactBook contacts.
	menuBar := (self rootCommandsGroup / 'MenuBar') asMenuBarPresenter.
]

{ #category : #initialization }
EgContactBookPresenter >> initializeWindow2: aWindowPresenter [
	super 	initializeWindow: aWindowPresenter.
	aWindowPresenter title: self title
]

{ #category : #testing }
EgContactBookPresenter >> isContactSelected [

	^ self table selectedItems isNotEmpty
]

{ #category : #actions }
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

{ #category : #actions }
EgContactBookPresenter >> newPhone [
	| phone |
	phone := self 
		request: 'New phone for the contact'
		initialAnswer: self selectedContact phone 
		title: 'Set new phone for contact'.
	(phone matchesRegex: '\d\d\d\s\d\d\d')
		ifFalse: [ 
			SpInvalidUserInput signal: 'The phone number is not well formated. 
Should match "\d\d\d\s\d\d\d"' ].
	^ phone
]

{ #category : #accessing }
EgContactBookPresenter >> selectedContact [
	^ table selection selectedItem
]

{ #category : #initialization }
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

{ #category : #initialization }
EgContactBookPresenter >> title [ 
	^ 'Pharo Contact Book'
]

{ #category : #updating }
EgContactBookPresenter >> updateView [
	table items: contactBook contacts
]
