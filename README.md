# sylphaddr2abook

Convert sylpheed address books to abooks.

# Usage

    sylphaddr2csv.rb: convert sylpheed address-book to csv
        -a book1,book2,..,               Address-books
            --address-book
        -i, --initial_index INDEX        Initial address output index
        -h, --help

So, call it like this:

    $ ruby sylphaddr2abook.rb -a book1,book2

The script will parse `book1` and `book2` and output the resulting abook to stdout. If you
already have an abook, you can also pass the index with which to start the output abook.
Use `-i` for this. Example:

    $ ruby sylphaddr2abook.rb -a ~/.sylpheed-2.0/addrbook-000001.xml -i 100

With this, the addresses will start at 100 instead of 0.

