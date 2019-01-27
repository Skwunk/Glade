package entities.player;

import entities.items.Item;

class Inventory
{
	public var Order:List<ITEM_TYPE>;
	public var Bag:Map<ITEM_TYPE, Int>;
	public var hasChanged:Bool;

	public function new()
	{
		Order = new List<ITEM_TYPE>();
		Bag = new Map<ITEM_TYPE, Int>();
		hasChanged = false;
	}

	public function GiveItem(item:ITEM_TYPE, number:Int=1):Bool
	{
		hasChanged = true;
		if(Bag.exists(item))
		{
			Bag.set(item, Bag.get(item) + number);
		}
		else
		{
			Order.add(item);
			Bag.set(item, number);
		}
		return true;
	}

	public function RemoveItem(item:ITEM_TYPE, number:Int=-1):Bool
	{
		hasChanged = true;
		if(!Bag.exists(item))
		{
			return false;
		}

		if(number < 0 || number >= Bag.get(item))
		{
			Order.remove(item);
			Bag.remove(item);
		}
		else
		{
			Bag.set(item, Bag.get(item) - number);
		}

		return true;
	}

	public function HasItem(item:ITEM_TYPE, number:Int=1):Int
	{
		if(Bag.get(item) < number)
		{
			return 0;
		}
		else
		{
			return Bag.get(item);
		}
	}

	public function setChangeFalse():Void
	{
		hasChanged = false;
	}

}