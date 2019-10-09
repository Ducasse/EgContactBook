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

{ #category : #converting }
EgAddContactCommand >> asSpecCommand [
	"Here we define the additional information the command will need to know
	 when used in the Spec framework.
	"
	^ super asSpecCommand
		shortcutKey: $n meta;
		iconName: #changeAdd;
		yourself
]

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
