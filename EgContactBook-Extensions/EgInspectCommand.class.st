Class {
	#name : #EgInspectCommand,
	#superclass : #EgContactBookCommand,
	#category : #'EgContactBook-Extensions'
}

{ #category : #executing }
EgInspectCommand >> execute [
	self context inspect
]

{ #category : #initialization }
EgInspectCommand >> initialize [
	super initialize.
	self
		name: 'Inspect';
		description: 'Inspect the context of this command.'
]
