Class {
	#name : #EgContactBook,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#classInstVars : [
		'family',
		'coworkers'
	],
	#category : #EgContactBook
}

{ #category : #accessing }
EgContactBook class >> coworkers [
	^coworkers ifNil: [ 
		coworkers := self new 
			add: 'Stef' phone: '112 378';
			add: 'Pavel' phone: '898 678';
			add: 'Marcus' phone: '444 888';
			yourself]
]

{ #category : #accessing }
EgContactBook class >> family [
	^family ifNil: [ 
		family := self new 
			add: 'John' phone: '342 345';
			add: 'Bill' phone: '123 678';
			add: 'Marry' phone: '789 567';
			yourself]
]

{ #category : #accessing }
EgContactBook class >> reset [
	<script>
	coworkers := nil.
	family := nil
]

{ #category : #initialization }
EgContactBook >> add: contactName phone: phone [
	| contact |
	contact := EgContact new name: contactName; phone: phone.
	self addContact: contact.
	^ contact
]

{ #category : #initialization }
EgContactBook >> addContact: aContact [
	contents add: aContact
]

{ #category : #initialization }
EgContactBook >> addContact: newContact after: contactAfter [ 
	contents add: newContact after: contactAfter
]

{ #category : #initialization }
EgContactBook >> contents [
	^ contents
]

{ #category : #initialization }
EgContactBook >> contents: anObject [
	contents := anObject
]

{ #category : #initialization }
EgContactBook >> includesContact: aContact [
	^ contents includes: aContact
]

{ #category : #initialization }
EgContactBook >> initialize [

		super initialize.
		contents := OrderedCollection new
]

{ #category : #initialization }
EgContactBook >> removeContact: aContact [
	contents remove: aContact
]
