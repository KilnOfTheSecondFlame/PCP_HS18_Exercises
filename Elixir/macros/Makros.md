# Write macros responsibly
[Elixir Lang - Macros](https://elixir-lang.org/getting-started/meta/macros.html#write-macros-responsibly)

Macros are a powerful construct and Elixir provides many mechanisms to ensure they are used responsibly.

* Macros are __hygienic__: by default, __variables__ defined __inside a macro are not going to affect the user code__. Furthermore, __function calls and aliases__ available in the macro context __are not going to leak__ into the user context.

* Macros are __lexical__: __it is impossible to inject code or macros globally__. In order to __use a macro__, you need to __explicitly require or import__ the module that defines the macro.

* Macros are __explicit__: it is __impossible to run a macro without explicitly invoking it__ (C ... ;-) ). For example, some languages allow developers to completely rewrite functions behind the scenes, often via parse transforms or via some reflection mechanisms. In Elixir, a macro must be explicitly invoked in the caller during compilation time.

* Macros’ language is __clear__: elixir provides  _no_ __syntax shortcuts for quote and unquote__. In Elixir, we preferred to have them explicitly spelled out, in order to clearly delimit the boundaries of a macro definition and its quoted expressions.
