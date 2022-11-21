Figure Test
===========

.. figure:: p.jpg
   :scale: 50 %

   This is the caption of the figure (a simple paragraph).

   The legend consists of all elements after the caption.  In this
   case, the legend consists of this paragraph and the following
   table:

   +--------------------------------+-----------------------+
   | Symbol                         | Meaning               |
   +================================+=======================+
   | .. image:: t1.jpg              | test using archion    |
   |    :target: ../_images/t1.jpg  |                       |
   +--------------------------------+-----------------------+
   | .. image:: t2.jpg              | test using archion    |
   +--------------------------------+-----------------------+

Below is a figure whose caption includes a list of inages. This there is a figure, a pciture,
followed by a list of pictures.

.. figure:: p.jpg
   :scale: 50 %
   :align: left

   This is the caption of the figure, a paragrah plus unordered list.

   The legend consists of all elements after the caption.  In this
   case, the legend consists of this paragraph and the following
   unordered list:

   * Image A from church book

   .. image:: t1.jpg         
      :target: ../_images/t1.jpg

   * Image B from church book

     .. image:: t1.jpg         
        :target: ../_images/t1.jpg


Below is a list table that contains figures that could have captions, scaled and have tagets.

.. list-table:: Title
   :header-rows: 1

   * - Heading row 1, column 1
     - Heading row 1, column 2
     - Heading row 1, column 3
   * -
       .. image:: t1.jpg         
          :target: ../_images/t1.jpg
     -
     -
   * - Row 2, column 1
     - Row 2, column 2
     - Row 2, column 3

