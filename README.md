# Little wrapper for AutoItX3 in nim-lang
testet with autoit-v3.3.14.2

module docs:
    http://enthus1ast.github.io/nimau3/

more infos on Auto IT:
    https://www.autoitscript.com/site/autoit/
    
Auto IT docs:
    https://www.autoitscript.com/autoit3/docs/

Place the AutoItX3.dll next to this file.

use the proc `L` to fill the functions like so:
L"my nice string"


Examples:

    import nimau3
    
    when isMainModule:
      AU3_Init()
      AU3_ClipPut( L"huhu" )
    
      # we tell autoit to match anywhere in the title
      discard AU3_AutoItSetOption(L"WinTitleMatchMode" , cint(2) )
      echo AU3_WinSetTitle(szTitle = L"Editor" ,
                      szText = L"",
                      szNewTitle = L"Hello my friend :)")
    
      echo AU3_WinKill(L"Rechner",L"")
