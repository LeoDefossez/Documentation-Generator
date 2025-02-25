"
super class => Object


subclasses => MySubclass


instance variables => 
myvar => myvar:, myvar
yourVar => yourVar


MyClass>>#yourVar =>
MySubSubclass>>#usingYourVar

MyClass>>#myvar: =>


MyClass>>#usingMyVar =>
MySubclass>>#usingUsingMyVar

MyClass>>#myvar =>
MyClass>>#usingMyVar
"
Class {
	#name : #MyClass,
	#superclass : #Object,
	#instVars : [
		'myvar',
		'yourVar'
	],
	#category : #'Documentation-Generator-test'
}

{ #category : #accessing }
MyClass >> myvar [
	^ myvar
]

{ #category : #accessing }
MyClass >> myvar: anObject [
	myvar := anObject
]

{ #category : #'as yet unclassified' }
MyClass >> usingMyVar [
	self myvar class.
]

{ #category : #accessing }
MyClass >> yourVar [
	^ yourVar
]
