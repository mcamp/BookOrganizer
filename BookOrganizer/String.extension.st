Extension { #name : #String }

{ #category : #'*BookOrganizer' }
String >> escaped [

	| stream |
	stream := WriteStream on: (self class new: self basicSize).
	self do: [ :char | 
		char == $&
			ifTrue: [ stream nextPutAll: '\&' ]
			ifFalse: [ stream nextPut: char ]
	].
	^ stream contents
]
