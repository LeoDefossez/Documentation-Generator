Class {
	#name : #ClassDocGenerator,
	#superclass : #Object,
	#category : #'Documentation-Generator'
}

{ #category : #utilities }
ClassDocGenerator class >> from: aClass getReferencesTo: aVar [
	| allReferences |
	allReferences := aClass methods select: [ :each | each ast references: aVar ].
	"only return the name of the methods, without the class included"
	 ^ allReferences collect: [ :each | (each name substrings: '#') at:2 ]
]

{ #category : #utilities }
ClassDocGenerator class >> generateDoc: aClass [
	aClass comment: 
	((self getSuperclassComment: aClass), '\\\',
	(self getSubclassesComment: aClass), '\\\',
	(self getVarsComment: aClass), '\\\',
	(self getMethodsComment: aClass)) withCRs.
]

{ #category : #utilities }
ClassDocGenerator class >> getMethodsComment: aClass [
	| allMethods |
	allMethods := aClass methods.
	
	^ '\\'  join: (allMethods collect: [ :each | each name , ' =>\' , ('\' join: each senders) ]).
]

{ #category : #utilities }
ClassDocGenerator class >> getSubclassesComment: aClass [
	| res |
	res := ', ' join: aClass subclasses .

	^ 'subclasses => ', res
]

{ #category : #utilities }
ClassDocGenerator class >> getSuperclassComment: aClass [
	^ 'super class => ', aClass superclass name.
]

{ #category : #utilities }
ClassDocGenerator class >> getVarsComment: aClass [
	| vars varsRef |
	vars := aClass instVarNames.

	"getting the references to each variables and converting the collection to a String"
	varsRef := vars
		collect:
			[ :each | each , ' => ' , (', ' join: (self from: aClass getReferencesTo: each)) ].
	^ 'instance variables => \' , ('\' join: varsRef).
]
