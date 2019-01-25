package cutscene;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class CutsceneState extends FlxState
{
	public var Background:FlxSprite;
	public var Text:FLxText;

	public var Commands:Array<COMMAND>;
	public var CommandPos:Int;

	override public function create():Void
	{
		Background = new FlxSprite();
		add(Background);

		Commands = new Array<COMMAND>();
		Commands = [MakeImage(255, 255, 255), ShowText("one"), MakeImage(0, 255, 0), ShowText("two")];
	}

	public function processComand(cmd:COMMAND):Void
	{
		switch(cmd)
		{
			case ShowText(txt:String):

		}
	}
}

enum COMMAND
{
	ShowText(text:String);
	ShowImage(path:String);
	MakeImage(r:Int, g:Int, b:Int);
}