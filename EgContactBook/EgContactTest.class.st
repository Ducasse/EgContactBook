Class {
	#name : #EgContactTest,
	#superclass : #TestCase,
	#instVars : [
		'contactBook',
		'includedContact',
		'nonIncludedContact'
	],
	#category : #EgContactBook
}

{ #category : #running }
EgContactTest >> setUp [ 

	super setUp.
	contactBook  := EgContactBook new.
	includedContact := EgContact name: 'Included Entry' phone: '11223344'.
	nonIncludedContact := EgContact name: 'No Entry' phone: '00223344'.
	
	contactBook addContact: includedContact 
]

{ #category : #tests }
EgContactTest >> testAddingAnEntryAddsTheEntry [

	contactBook addContact: nonIncludedContact.
	self assert: contactBook size equals: 2.
]

{ #category : #tests }
EgContactTest >> testAddingAnEntryNowIncludesEntry [

	contactBook addContact: nonIncludedContact.
	self assert: (contactBook includesContact: nonIncludedContact)
]

{ #category : #tests }
EgContactTest >> testDoesNotFindANonIncludedEntry [

	self assert: (contactBook findContactsWithText: 'No') size equals: 0
]

{ #category : #tests }
EgContactTest >> testFindsAnIncludedEntry [

	self assertCollection: (contactBook findContactsWithText: 'Included') hasSameElements: {includedContact}
]
