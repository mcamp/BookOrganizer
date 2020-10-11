Class {
	#name : #MORetrieverTest,
	#superclass : #TestCase,
	#instVars : [
		'retriever',
		'book'
	],
	#category : #'MangaOrganizer-Tests'
}

{ #category : #running }
MORetrieverTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	retriever := MOMockRetriever new.
	book := MOBook new.
]

{ #category : #tests }
MORetrieverTest >> testConnectBook [

	retriever retrieveBook: book location: 'MyMock-mybook'.

	self assert: book link equals: 'MyMock-mybook'
]

{ #category : #tests }
MORetrieverTest >> testConnection [

	self assert: retriever isConnected
]

{ #category : #tests }
MORetrieverTest >> testIdentifier [

	self assert: retriever name equals: 'Mock'.
	self assert: retriever location equals: 'MyMock'.
]

{ #category : #tests }
MORetrieverTest >> testRetrieveChapters [

	retriever retrieveBook: book location: 'MyMock-mybook'.
	self assert: book chapters size equals: 0.
	
	retriever retrieveChaptersFromBook: book.
	self assert: book chapters size equals: 3.
	self assert: book chapters first link equals: 'MyMock-mybook/1'.
	self assert: book chapters second link equals: 'MyMock-mybook/2'.
	self assert: book chapters third link equals: 'MyMock-mybook/3'.	
]
