The scale option for `:image:` and `:figure:` seems to require the the python Pillow package according to

* https://docutils.sourceforge.io/docs/ref/rst/directives.html#image

* https://docutils.sourceforge.io/docs/ref/rst/directives.html#figure

The default figure--and image?--target seems to be to display the full image.

You can add legend text to a figure that can even include a table, as the docutils documentation example
shows, and likely an html list. These legend-contained images can include a target, but the 
path must be specified as `../_images/blah-target.jpg`, which is sort of a hassle.
