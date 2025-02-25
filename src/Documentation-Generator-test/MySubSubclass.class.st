"
super class => MySubclass


subclasses => 


instance variables => 



MySubSubclass>>#usingYourVar =>

"
Class {
	#name : #MySubSubclass,
	#superclass : #MySubclass,
	#category : #'Documentation-Generator-test'
}

{ #category : #'as yet unclassified' }
MySubSubclass >> usingYourVar [
	self yourVar class.
]
