#!/bin/bash
# Create a list of attachment paths that are assoicated with the Books collection in Zotero

sqlite3 -header -separator $'\t'  ~/Zotero/zotero.sqlite "select itemAttachments.itemID, quote(itemAttachments.path), items.key, itemAttachments.parentItemID, collections.collectionName, collections.libraryID from itemAttachments
        inner join items on items.itemID = itemAttachments.itemID
        inner join collectionItems on itemAttachments.parentItemID = collectionItems.itemID
        inner join collections on collectionItems.collectionID = collections.collectionID
        where collections.collectionName = 'Research' and collections.libraryID;" \
| cut -d$'\t' -f 2,3 | grep storage | awk -F'\t' '{gsub(/storage:/, "/home/linn/Zotero/storage/" $2 "/"); print $1}' | sed -e "s/^'\(.*\)'$/\"\1\"/"
