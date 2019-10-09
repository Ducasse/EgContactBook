"
| presenter cmd |
presenter := EgContactBookPresenter on: EgContactBook coworkers.
cmd := EgAddContactCommand new context: presenter.
cmd execute
"
Class {
	#name : #EgAddContactCommand,
	#superclass : #EgContactBookCommand,
	#category : #EgContactBook
}

{ #category : #initialization }
EgAddContactCommand >> execute [
	
	| contact |
	contact := self contactBookPresenter newContact.
	self hasSelectedContact
		ifTrue: [ self contactBook addContact: contact after: self selectedContact ]
		ifFalse: [ self contactBook addContact: contact ].
		
	self contactBookPresenter updateView
]

{ #category : #initialization }
EgAddContactCommand >> initialize [
	super initialize.
	self
		name: 'New contact'; 
		description: 'Creates a new contact and add it to the contact book.'
]
