Class {
	#name : #BaselineOfGt4RabbitMq,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4RabbitMq
}

{ #category : #loading }
BaselineOfGt4RabbitMq class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt4rabbitmq' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGt4RabbitMq >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Gt4RabbitMq'
		]
]
