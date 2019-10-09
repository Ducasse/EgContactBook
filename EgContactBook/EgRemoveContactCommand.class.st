Class {
	#name : #EgRemoveContactCommand,
	#superclass : #EgContactBookCommand,
	#category : #EgContactBook
}

{ #category : #testing }
EgRemoveContactCommand >> canBeExecuted [
	^ self context isContactSelected
]

{ #category : #executing }
EgRemoveContactCommand >> execute [
	self contactBook removeContact: self selectedContact.
	self contactBookPresenter updateView
]

{ #category : #initialization }
EgRemoveContactCommand >> initialize [
	super initialize.
	self
		name: 'Remove'; 
		description: 'Removes the selected contact from the contact book.'
]
