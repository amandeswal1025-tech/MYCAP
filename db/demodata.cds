namespace aman.db;

using { aman.reuse as reuse } from './reuse';
using { cuid , temporal , managed  } from '@sap/cds/common';


context master  {
    entity student : reuse.address {
        key id: reuse.Guid;
        name: String(80);
        age: Int16;
        brilliant: Boolean;
        semester: Association to one semester;
    }
    entity semester {
        key id: reuse.Guid;
        semester: String(80);
        specialization: String(80);
        hod: String(80);
    }
entity books {
        key id: reuse.Guid;
        bookname: localized String(80);
        author: String(80);
}
}
context transaction { 
entity subs : cuid , temporal , managed {
        book :Association to one master.books;
        student : Association to one master.student;
    }

}