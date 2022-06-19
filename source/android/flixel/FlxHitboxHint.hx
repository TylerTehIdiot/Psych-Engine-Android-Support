package android.flixel;

import android.flixel.FlxButton;
import android.flixel.FlxHitbox;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class FlxHitboxHint extends FlxButton
{
	public function new(x:Float = 0, y:Float = 0, frames:String)
	{
		super(x, y);

		loadGraphic(FlxGraphic.fromFrame(getFrames().getByName(frames)));
		alpha = 0.00001;

		var tween:FlxTween = null;
		onDown.callback = function()
		{
			if (tween != null)
				tween.cancel();

			tween = FlxTween.num(alpha, 0.75, 0.075, {ease: FlxEase.circInOut}, function(value:Float)
			{
				alpha = value;
			});
		}

		onUp.callback = function()
		{
			if (tween != null)
				tween.cancel();

			tween = FlxTween.num(alpha, 0.00001, 0.15, {ease: FlxEase.circInOut}, function(value:Float)
			{
				alpha = value;
			});
		}

		onOut.callback = function()
		{
			if (tween != null)
				tween.cancel();

			tween = FlxTween.num(alpha, 0.00001, 0.15, {ease: FlxEase.circInOut}, function(value:Float)
			{
				alpha = value;
			});
		}

		#if FLX_DEBUG
		ignoreDrawDebug = true;
		#end
	}

	public function getFrames():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('android/hitbox');
	}
}
