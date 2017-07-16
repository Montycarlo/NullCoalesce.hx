package;

using NullCoalesce;

@:nullcoalesce
@:final class Main{

  public static function main():Void{
    var x:Dynamic = null;

    var y:String = x ||~ "default";
    var z = x ||~ "default";

    trace('y: $y');
    trace('z: $z');

    x = "{x}";
    y = x ||~ "default";

    trace('set $$x to $x');
    trace('set $$y to $$x');
    trace('y: $y');
  }

}
