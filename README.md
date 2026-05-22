Math Homework Files
---

These are the files I use to create my math homeworks in Vim with VimTeX.

Changes:
- added symbols in latex/hwsymb.sty
- added non simurgh9 latex/mla.cls
- added loosely simurgh9 latex/notes.cls
- added automatic color generation (use `style_color` and `style1, style2, bstyle1, bstyle2` for hue shift in the forward and backward direction)
- added many packages (most importantly, physics.sty!)
- added iffy question verification tool (`\question[0]{number}{text}` will add `number` to the list of unchecked questions at the bottom of the last page. Use `\skipquestioncheck{}` to disable.)
- added `\qprt{number}{text}` for subquestions
- question margin symbols will adjust properly in multicol environments
- styling

The original LaTeX files can be found at https://github.com/simurgh9/hw.
