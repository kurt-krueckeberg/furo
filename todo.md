# Figures and Images

The scale option for `:image:` and `:figure:` seems to require the the python Pillow package according to

* https://docutils.sourceforge.io/docs/ref/rst/directives.html#image

* https://docutils.sourceforge.io/docs/ref/rst/directives.html#figure


When using figures in tables, width seesm to be a better choice and avoids distortion.

The default figure--and image--target seems to be to display the full image.

You can add caption and legend text to a figure caption. The legend can even include a paragrph and a table, as the docutils documentation example
shows, or aist. When image or figures have a target, the path must be specified as `../_images/blah-target.jpg`, which 
is sort of a hassle.

Idea:
Maybe an ordered list or  single column talbe of giures with captions, targets, a figclass and a width (or figwidth)--or default-clickable figures 
