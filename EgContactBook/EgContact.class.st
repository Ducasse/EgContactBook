Class {
	#name : #EgContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'phone'
	],
	#category : #EgContactBook
}

{ #category : #'instance creation' }
EgContact class >> name: aNameString phone: aPhoneString [

	^ self new
		name: aNameString;
		phone: aPhoneString;
		yourself
]

{ #category : #printing }
EgContact >> hasMatchingText: aString [ 
	
	^ name includesSubstring: aString caseSensitive: false
]

{ #category : #printing }
EgContact >> name [
	^ name
]

{ #category : #printing }
EgContact >> name: aString [
	name := aString
]

{ #category : #printing }
EgContact >> phone [
	^ phone
]

{ #category : #printing }
EgContact >> phone: anObject [
	phone := anObject
]

{ #category : #printing }
EgContact >> printOn: aStream [

		super printOn: aStream.
		aStream nextPut: $(.
		aStream nextPutAll: name.
		aStream nextPut: $).
]
