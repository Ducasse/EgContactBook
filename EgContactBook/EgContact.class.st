Class {
	#name : #EgContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'phone'
	],
	#category : #EgContactBook
}

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