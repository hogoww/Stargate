"
I'm a reflective builder for a mapping rule set (see MappingRuleSet).

I'm being used to build a mapping rule set reflectively. I expect web service specification declare its rules on messages that follow the pattern #add*MappingIn:
"
Class {
	#name : #ReflectiveMappingRuleSetBuilder,
	#superclass : #Object,
	#instVars : [
		'specification'
	],
	#category : #'Stargate-Model-Mapping'
}

{ #category : #'instance creation' }
ReflectiveMappingRuleSetBuilder class >> for: aResourceRESTfulControllerSpecification [

	^ self new initializeFor: aResourceRESTfulControllerSpecification
]

{ #category : #building }
ReflectiveMappingRuleSetBuilder >> build [

	| builder |

	builder := MappingRuleSetBuilder new.

	(KeywordMessageSendingCollector
		sendingAllMessagesBeginningWith: 'add'
		andEndingWith: 'MappingIn:'
		to: specification 
		with: builder) value.

	^ builder build
]

{ #category : #initialization }
ReflectiveMappingRuleSetBuilder >> initializeFor: aResourceRESTfulControllerSpecification [

	specification := aResourceRESTfulControllerSpecification
]