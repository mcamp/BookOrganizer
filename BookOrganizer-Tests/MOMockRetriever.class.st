Class {
	#name : #MOMockRetriever,
	#superclass : #MORetriever,
	#category : #'BookOrganizer-Tests'
}

{ #category : #book }
MOMockRetriever >> bookFullLocation: aBook [

	^ self location , '-' , (self bookLocation: aBook )
]

{ #category : #'instance creation' }
MOMockRetriever >> initialize [
	super initialize.
	name := 'Mock'.
	location := 'MyMock'.
	
]

{ #category : #testing }
MOMockRetriever >> isConnected [
	^ true.
]

{ #category : #retrieve }
MOMockRetriever >> retrieveChaptersFromBook: aBook [

	aBook addChapter: (MOChapter new link: aBook link , '/1'; number: 1).
	aBook addChapter: (MOChapter new link: aBook link , '/2'; number: 2).
	aBook addChapter: (MOChapter new link: aBook link , '/3'; number: 3).
]
