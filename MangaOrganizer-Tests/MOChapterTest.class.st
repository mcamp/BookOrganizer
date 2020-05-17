Class {
	#name : #MOChapterTest,
	#superclass : #TestCase,
	#instVars : [
		'chapter'
	],
	#category : #'MangaOrganizer-Tests'
}

{ #category : #running }
MOChapterTest >> setUp [
	
	chapter := MOChapter new
]

{ #category : #tests }
MOChapterTest >> testRead [

	self deny: chapter wasRead.
	chapter read.
	self assert: chapter wasRead.
	chapter read.
	self assert: chapter wasRead.
	chapter unread.
	self deny: chapter wasRead.
	chapter unread.
	self deny: chapter wasRead.
]
