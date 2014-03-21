require './myl.rb'
class Myl
macro
  BLANK         \s+
  DIGIT         \d+
  IDENT         [a-zA-Z_][a-zA-Z0-9_]*
  DEF           Signal
  END           end
  TOKFUNCTION   def
  TOKENVAR      var
  LBRACKET      \(
  RBRACKET      \)
  TOKENFOREACH  foreach
  TOKENIF       if
  TOKENELSE     else
  TOKENCASE     when
  TOKENSWITCH   case

rule
  {BLANK}
  {TOKENELSE}     { [:TOKENELSE, text]}
  {TOKENIF}       { [:TOKENIF, text]}
  {TOKFUNCTION}   { [:TOKFUNCTION, text] }
  {TOKENCASE}     { [:TOKENCASE, text] }
  {TOKENSWITCH}   { [:TOKENSWITCH, text]}
  {DEF}           { [:TOKENDEF, text] }
  {END}           { [:TOKENEND, text] }
  {TOKENVAR}      { [:TOKENVAR, text] }
  {TOKENFOREACH}  { [:TOKENFOREACH, text]}
  {DIGIT}         { [:NUMBER, text.to_i] }
  {IDENT}         { sym = $SymTable.get_by_name(text)
                    p "debug rex: sym - find #{text}"
                    p sym
                    return [sym.type.to_sym, text] unless sym.nil?
                    [:WORD, text]
                  }
  .|\n            { [text, text] }
  {LBRACKET}      { ['('] }
  {RBRACKET}      { [')'] }
  \,              { [','] }
  \[              { ['['] }
  \]              { [']'] }
  \=              { ['='] }
  \:              { [':'] }
  \>              { ['>'] }
  \<              { ['<'] }
  \!              { ['!'] }
  \&              { ['&'] }
  \|              { ['|'] }
  
inner
end
