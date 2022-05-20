# Why use a PS Module

```
Windows PowerShell modules allow you to partition, organize, and abstract your Windows PowerShell code into self-contained, reusable units. With these reusable units, administrators, script developers, and cmdlet developers can easily share their modules directly with others. Script developers can also repackage third-party modules to create custom script-based applications. Modules, similar to modules in other scripting languages such as Perl and Python, enable production-ready scripting solutions that use reusable, redistributable components, with the added benefit of enabling you to repackage and abstract multiple components to create custom solutions.
```

1) Allows us to maintain a standard structure
1) Can be centralised into a PS Repo
1) Ease of access through PowershellGet
1) Great for debugging
1) Makes it simple to execute logic in the same way from various locations, e.g. locally or a build server
1) Versioning. Can hold and target specific versions
1) A module can be packaged or maintained in a PS Repo
1) Provides a way of grouping functions for a similar purpose. e.g. all PS functions created to work with the tool 'xyz'.
1) Can be written in C#
1) We have a ready made method to template modules, that integrates well with VSCode. This includes testing with Pester.


Of course a module isn't always needed. Sometime a simple script is all that's required.

[Writing a Windows PowerShell Module](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/writing-a-windows-powershell-module?view=powershell-7.2&viewFallbackFrom=powershell-7.1)

Maybe try a code dojo: [Rock Paper Scissors Lizard Spock](https://github.com/robcthegeek/dojo-starter-facilitator/blob/main/problems/Rock-Paper-Scissors-Lizard-Spock.md)
