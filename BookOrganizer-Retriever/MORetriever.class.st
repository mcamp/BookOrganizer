Class {
	#name : #MORetriever,
	#superclass : #Object,
	#instVars : [
		'name',
		'location'
	],
	#category : #'BookOrganizer-Retriever'
}

{ #category : #accessing }
MORetriever >> location [
	^ location
]

{ #category : #accessing }
MORetriever >> location: anObject [
	location := anObject
]

{ #category : #accessing }
MORetriever >> name [
	^ name
]

{ #category : #accessing }
MORetriever >> name: anObject [
	name := anObject
]

{ #category : #retrieve }
MORetriever >> retrieveBook: aBook location: aString [
	aBook link: aString.
	self retrieveChaptersFromBook: aBook
]
