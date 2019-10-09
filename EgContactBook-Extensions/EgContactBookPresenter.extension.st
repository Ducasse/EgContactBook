Extension { #name : #EgContactBookPresenter }

{ #category : #'*EgContactBook-Extensions' }
EgContactBookPresenter class >> changePhoneCommandWith: presenter 
	forRootGroup: aCommandsGroup [
	<extensionCommands>
	
	(aCommandsGroup / 'Context Menu')
		register: (EgChangePhoneCommand forSpec context: presenter)
]

{ #category : #'*EgContactBook-Extensions' }
EgContactBookPresenter class >> extraCommandsWith: presenter forRootGroup: aCmCommandsGroup [
	<extensionCommands>
	aCmCommandsGroup / 'Context Menu'
		register:
			((CmCommandGroup named: 'Extra') asSpecGroup
				description: 'Extra commands to help during development.';
				register:
					((EgInspectCommand forSpec context: [ presenter selectedContact ])
						name: 'Inspect contact';
						description: 'Open an inspector on the selected contact.';
						iconName: #smallFind;
						yourself);
				register:
					((EgInspectCommand forSpec context: [ presenter contactBook ])
						name: 'Inspect contact book';
						description: 'Open an inspector on the contact book.';
						yourself);
				yourself)
]
