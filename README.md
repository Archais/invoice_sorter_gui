# invoice_sorter_gui

This project was an attempt to convert the [invoice_sorter](https://github.com/Eskill-Trading/invoice-sorter) app that I wrote in Python to a GUI app written with Flutter & Dart. Unfortunately, I was unable to find a package that would enable the extraction of text from the pdf invoices. I attempted to overcome this shortcoming by using FFI to use a C library. The library I eventually settled on after numerous tests was the [PDFIO](https://www.msweet.org/pdfio/) library.

In the end, the complexities of binding this library in Dart became too huge to warrant this approach. This project will closed until further notice unless I receive advice / aid for converting the library.
