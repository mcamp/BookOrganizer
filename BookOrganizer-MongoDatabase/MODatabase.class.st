Class {
	#name : #MODatabase,
	#superclass : #MOPersistence,
	#instVars : [
		'repository'
	],
	#category : #'BookOrganizer-MongoDatabase'
}

{ #category : #defaults }
MODatabase >> defaultDB [
	^ 'book_organizer'
]

{ #category : #defaults }
MODatabase >> defaultHost [
	^ 'localhost'
]

{ #category : #defaults }
MODatabase >> defaultPassword [
	^ ''
]

{ #category : #defaults }
MODatabase >> defaultPort [
	^ 27017
]

{ #category : #defaults }
MODatabase >> defaultUsername [
	^ OSEnvironment current at: 'USER' ifAbsent: [ '' ]
]

{ #category : #initialization }
MODatabase >> initialize [
	super initialize.
	
	repository := VOMongoRepository 
		host: (OSEnvironment current at: 'BOOK_ORGANIZER_HOST' ifAbsent: [ self defaultHost ])
		port: (OSEnvironment current at: 'BOOK_ORGANIZER_PORT' ifAbsent: [ self defaultPort ])
		database: (OSEnvironment current at: 'BOOK_ORGANIZER_DB' ifAbsent: [ self defaultDB ])
		username: (OSEnvironment current at: 'BOOK_ORGANIZER_USERNAME' ifAbsent: [ self defaultUsername ])
		password: (OSEnvironment current at: 'BOOK_ORGANIZER_PASSWORD' ifAbsent: [ self defaultPassword ])
]

{ #category : #action }
MODatabase >> save: anEntity [

	repository save: anEntity 
]
