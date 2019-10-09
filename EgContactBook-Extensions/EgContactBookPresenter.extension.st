Extension { #name : #EgContactBookPresenter }

{ #category : #'*EgContactBook-Extensions' }
EgContactBookPresenter class >> changePhoneCommandWith: presenter 
	forRootGroup: aCommandsGroup [
	<extensionCommands>
	
	(aCommandsGroup / 'Context Menu')
		register: (EgChangePhoneCommand forSpec context: presenter)
]
