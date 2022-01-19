- assocate URLs with browser 
  > Get-Help Login-AzAccount -Online
  > Get-Help: Starting a browser to display online Help failed. No program or browser is associated to open the URI 
  > https://docs.microsoft.com/powershell/module/az.accounts/connect-azaccount.
- launch terminal with PWSH not BASH
- fold by default, see https://marketplace.visualstudio.com/items?itemName=maptz.regionfolder

```json     
    "maptz.regionfolder": {
        "[markdown]": {        
            "defaultFoldStartRegex": "\\<!--[\\s]*#region\\(collapsed\\)[\\s]*(.*)",

            "foldEnd": "<!-- #endregion -->",
            "foldEndRegex": "\\<!--[\\s]*#endregion",
            "foldStart": "<!-- #region [NAME] -->",
            "foldStartRegex": "\\<!--[\\s]*#region[\\s]*(.*)"
        }
    }
```

- update vscode extensions
  > code --list-extensions --show-versions