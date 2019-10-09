Class {
	#name : #EgChangePhoneCommand,
	#superclass : #EgContactBookCommand,
	#instVars : [
		'newPhone'
	],
	#category : #'EgContactBook-Extensions'
}

{ #category : #executing }
EgChangePhoneCommand >> execute [
	self selectedContact phone: self contactBookPresenter newPhone.
	self contactBookPresenter updateView
]

{ #category : #initialization }
EgChangePhoneCommand >> initialize [
	super initialize.
	self
		name: 'Change phone';
		description: 'Change the phone number of the contact.'
]

{ #category : #accessing }
EgChangePhoneCommand >> newPhone [
	^ newPhone 
]

{ #category : #accessing }
EgChangePhoneCommand >> newPhone: anObject [
	newPhone := anObject
]
