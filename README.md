# nimau3
Wraps AutoItX3.dll


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
