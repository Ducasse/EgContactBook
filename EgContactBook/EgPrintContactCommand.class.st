Class {
	#name : #EgPrintContactCommand,
	#superclass : #EgContactBookCommand,
	#category : #EgContactBook
}

{ #category : #executing }
EgPrintContactCommand >> execute [

	Transcript open.
	self contactBook contacts do: [ :contact | self traceCr: contact name , ' - ' , contact name ]
]

{ #category : #initialization }
EgPrintContactCommand >> initialize [
	super initialize.
	self
		name: 'Print';
		description: 'Print the contact book in Transcript.'	
]
