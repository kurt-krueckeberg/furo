Figures and Images
==================
 
Remarks on reST
---------------

The scale option for ``:image:`` and ``:figure:`` seem to require the the python Pillow package according to

-  https://docutils.sourceforge.io/docs/ref/rst/directives.html#image

-  https://docutils.sourceforge.io/docs/ref/rst/directives.html#figure

When using figures in tables, the ``:width:`` seems to be a better choice that avoids distortion. Read up on
``figwidth`` and ``width``.

The default figure and image target-option seems to display the full image. Confirm this.

You can add caption and legend text to a figure caption. The legend can even include a paragraph and a table, as the 
docutils documentation example shows, or a list. 

When image or figures have a target, the path must be specified as ``../_images/target.jpg``, sort of a hassle.

Plans
-----

- For the image pages with their scaled verison and a transcription and individual's mentioned, an ordered list or single-column table
  of figures with captions, targets, a figclass, a width (or figwidth) and an explicit taget or the default self-target.
  The alginment of these figures can be either center or left.
- The pages of images will include a top-level header and section headers for info. like the person's name, citation and transcription.
  Later defived facts and events and sql-related information could be added.
- We need a location for transcribing the colum headers for event--baptism, marriage, etc. Including this usin an rst include.

Generate Pages
~~~~~~~~~~~~~~

Use an input spec file like a .toml file that will generate the .rst pages. 
 
