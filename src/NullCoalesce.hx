package;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import tink.SyntaxHub;
using tink.CoreApi;
using tink.MacroApi;
#end

class NullCoalesce{
  
  public function new(){}

#if macro
  public static function use(){
    SyntaxHub.exprLevel.inward.whenever(new NullCoalesce());
  }

  public function appliesTo(c:ClassBuilder):Bool{
    return c.target.meta.has(':nullcoalesce');
  }

  public function apply(e:Expr):Expr{
    switch e.expr{
      case EBinop(te,tt,tf):
        trace(te,tt,tf);
        switch te{
          case OpBoolOr:
            switch tf.expr{
              case EUnop(u_op, u_postfix, u_e):
                switch u_op{
                  case OpNegBits:
                    return @:pos(e.pos) macro {
                      ${tt} != null ? ${tt} : ${u_e};
                    };
                  default: return e;
                }
              default: return e;
            }
          default: return e;
        }
      default: return e;
    }
    return e;
  }
#end

}
