package entities.scenery;

import entities.StaticEntity;

class Object extends StaticEntity
{
	public var ObjectType:OBJECT_TYPE;
}

enum OBJECT_TYPE
{
	TREE;
	LEAVES;
}