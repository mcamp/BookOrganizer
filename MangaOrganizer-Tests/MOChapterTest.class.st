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
	
	chapter := MOChapterMockup new.
	chapter name: '[Season 1] Ep. 0';
		number: '1';
		link: 'https://www.webtoons.com/en/fantasy/tower-of-god/season-1-ep-0/viewer?title_no=95&episode_no=1'.
]

{ #category : #tests }
MOChapterTest >> testOpen [

	chapter open.
	self assert: chapter wasRead.
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
