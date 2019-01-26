package cutscene;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.util.FlxAxes;

class CutsceneState extends FlxState
{
	public var Background:FlxSprite;
	public var Text:FlxText;

	public var Commands:Array<COMMAND>;
	public var CommandPos:Int=0;

	override public function create():Void
	{
		Background = new FlxSprite();
		add(Background);

		Text = new FlxText(0, 0, "hahahahahahahahah", 20);
		Text.color = FlxColor.YELLOW;
		add(Text);

		Commands = new Array<COMMAND>();
		Commands = [ShowImage("assets/images/t.png"), ShowText("one"), MakeImage(0, 255, 0), ShowText("two")];
		runCommands();
	}

	override public function update(elapsed:Float):Void
	{
		if(FlxG.mouse.justPressed)
		{
			if(CommandPos < Commands.length)
			{
				runCommands();
			}
			else
			{
				FlxG.switchState(new PlayState());
			}
		}
	}

	public function runCommands():Void
	{
		do 
		{
			processCommand(Commands[CommandPos]);
			CommandPos ++;
		} while (Commands[CommandPos-1].getIndex() != 0);
	}

	public function processCommand(cmd:COMMAND):Bool
	{
		switch(cmd)
		{
			case ShowText(txt):
				Text.text = txt;
				Text.screenCenter(FlxAxes.X);
				Text.y = FlxG.height - Text.height - 5;
			
			case MakeImage(r, g, b):
				Background.makeGraphic(FlxG.width, FlxG.height, FlxColor.fromRGB(r, g, b));
			
			case ShowImage(path):
				Background.loadGraphic(path);
			
			default:
				trace("opps");
				return false;
		}
		return true;
	}
}

enum COMMAND
{
	ShowText(text:String);
	ShowImage(path:String);
	MakeImage(r:Int, g:Int, b:Int);
}